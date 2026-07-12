# /// script
# requires-python = ">=3.8"
# dependencies = []
# ///

#!/usr/bin/env python3
"""
Generate commits data JSON file for Hugo site.
Extracts git commits and formats them for use in the home page template.

Run with uv:
    uv run scripts/generate-commits-data.py
"""

import json
import subprocess
import sys
from datetime import datetime
from pathlib import Path

def run_git_command(args: list[str]) -> str:
    """Run a git command and return stdout."""
    try:
        result = subprocess.run(
            ["git"] + args,
            capture_output=True,
            text=True,
            check=True,
            cwd=Path(__file__).parent.parent
        )
        return result.stdout.strip()
    except subprocess.CalledProcessError as e:
        print(f"Error running git command: {' '.join(args)}", file=sys.stderr)
        print(f"Return code: {e.returncode}", file=sys.stderr)
        print(f"stdout: {e.stdout}", file=sys.stderr)
        print(f"stderr: {e.stderr}", file=sys.stderr)
        sys.exit(1)
    except Exception as e:
        print(f"Unexpected error: {e}", file=sys.stderr)
        sys.exit(1)

def get_commits(limit: int = 100) -> list[dict]:
    """Get recent commits with their details."""
    # Format: %H%n%h%n%an%n%ae%n%ai%n%s%n%b%n---COMMIT_SEPARATOR---%n
    # %H: full hash
    # %h: short hash
    # %an: author name
    # %ae: author email
    # %ai: author date (ISO 8601)
    # %s: subject
    # %b: body
    format_str = "%H%n%h%n%an%n%ae%n%ai%n%s%n%b%n---COMMIT_SEPARATOR---%n"
    
    log_output = run_git_command([
        "log",
        f"-{limit}",
        f"--format={format_str}"
    ])
    
    commits = []
    commit_blocks = log_output.split("---COMMIT_SEPARATOR---")
    
    for block in commit_blocks:
        if not block.strip():
            continue
            
        lines = block.strip().split("\n")
        if len(lines) < 6:
            continue
            
        full_hash = lines[0]
        short_hash = lines[1]
        author_name = lines[2]
        author_email = lines[3]
        author_date = lines[4]
        subject = lines[5]
        body = "\n".join(lines[6:]).strip() if len(lines) > 6 else ""
        
        # Get changed files for this commit
        changed_files_output = run_git_command([
            "diff-tree",
            "--no-commit-id",
            "--name-only",
            "-r",
            full_hash
        ])
        
        changed_files = [
            f.strip() for f in changed_files_output.split("\n") if f.strip()
        ]
        
        # Parse date
        try:
            date_obj = datetime.fromisoformat(author_date)
            formatted_date = date_obj.strftime("%B %d, %Y")
            iso_date = date_obj.isoformat()
        except:
            formatted_date = author_date
            iso_date = author_date
        
        commits.append({
            "full_hash": full_hash,
            "short_hash": short_hash,
            "author_name": author_name,
            "author_email": author_email,
            "date": formatted_date,
            "iso_date": iso_date,
            "subject": subject,
            "body": body,
            "changed_files": changed_files
        })
    
    return commits

def map_file_to_site_url(file_path: str) -> dict | None:
    """
    Map a git file path to a site URL.
    Returns dict with 'url' and 'type' or None if not a content file.
    """
    path = Path(file_path)
    
    # Content files in content/ directory
    if path.parts[0] == "content":
        # Remove 'content/' prefix and handle index.md files
        relative = str(path.relative_to("content"))
        
        # Handle _index.md files (section pages)
        if path.name == "_index.md":
            section = str(path.parent.relative_to("content"))
            url = f"/{section}/" if section else "/"
            return {"url": url, "type": "section"}
        
        # Handle regular content files
        if path.suffix in [".md", ".html"]:
            # Remove extension and _index suffix
            name = path.stem
            if name == "_index":
                name = ""
            
            # Build URL based on directory structure
            dir_parts = list(path.parent.parts[1:])  # Skip 'content'
            if name:
                dir_parts.append(name)
            
            url = "/" + "/".join(dir_parts) + "/"
            return {"url": url, "type": "page"}
    
    # Non-content files - link to GitHub blob
    return {
        "url": f"https://github.com/ssmiller25/r15cookie-site/blob/main/{file_path}",
        "type": "github"
    }

def main():
    """Generate commits data JSON file."""
    # Get the repo root directory
    repo_root = Path(__file__).parent.parent
    
    # Debug: Print current directory and check for .git
    print(f"Script location: {Path(__file__).absolute()}", file=sys.stderr)
    print(f"Repo root (calculated): {repo_root.absolute()}", file=sys.stderr)
    print(f"Current working directory: {Path.cwd().absolute()}", file=sys.stderr)
    
    # Check if .git exists
    git_dir = repo_root / ".git"
    if not git_dir.exists():
        print(f"ERROR: .git directory not found at {git_dir}", file=sys.stderr)
        print("Make sure you're running this from a git repository", file=sys.stderr)
        sys.exit(1)
    else:
        print(f"Found .git directory at {git_dir}", file=sys.stderr)
    
    data_dir = repo_root / "data"
    output_file = data_dir / "commits.json"
    
    # Ensure data directory exists
    data_dir.mkdir(exist_ok=True)
    
    # Get commits
    commits = get_commits(limit=100)  # Get more for pagination
    
    # Process commits and map file paths to URLs
    for commit in commits:
        mapped_files = []
        for file_path in commit["changed_files"]:
            mapped = map_file_to_site_url(file_path)
            if mapped:
                mapped["file_path"] = file_path
                mapped_files.append(mapped)
        
        commit["changed_files_mapped"] = mapped_files
    
    # Write JSON output
    with open(output_file, "w") as f:
        json.dump(commits, f, indent=2)
    
    print(f"Generated {len(commits)} commits data at {output_file}")

if __name__ == "__main__":
    main()
