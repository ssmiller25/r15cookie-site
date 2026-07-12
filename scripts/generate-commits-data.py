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

def run_git_command(args: list[str], cwd: Path = None) -> str:
    """Run a git command and return stdout."""
    try:
        result = subprocess.run(
            ["git"] + args,
            capture_output=True,
            text=True,
            check=True,
            cwd=cwd
        )
        return result.stdout.strip()
    except subprocess.CalledProcessError as e:
        print(f"Error running git command: git {' '.join(args)}", file=sys.stderr)
        print(f"Working directory: {cwd or Path.cwd()}", file=sys.stderr)
        print(f"Return code: {e.returncode}", file=sys.stderr)
        if e.stderr:
            print(f"Git error: {e.stderr}", file=sys.stderr)
        sys.exit(1)

def get_commits(limit: int = 100) -> list[dict]:
    """Get recent commits with their details."""
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
    """Map a git file path to a site URL."""
    path = Path(file_path)
    
    if path.parts[0] == "content":
        relative = str(path.relative_to("content"))
        
        if path.name == "_index.md":
            section = str(path.parent.relative_to("content"))
            url = f"/{section}/" if section else "/"
            return {"url": url, "type": "section"}
        
        if path.suffix in [".md", ".html"]:
            name = path.stem
            if name == "_index":
                name = ""
            
            dir_parts = list(path.parent.parts[1:])
            if name:
                dir_parts.append(name)
            
            url = "/" + "/".join(dir_parts) + "/"
            return {"url": url, "type": "page"}
    
    return {
        "url": f"https://github.com/ssmiller25/r15cookie-site/blob/main/{file_path}",
        "type": "github"
    }

def main():
    """Generate commits data JSON file."""
    # Get the repo root directory
    repo_root = Path(__file__).parent.parent
    
    # Change to repo root directory
    import os
    os.chdir(repo_root)
    
    # Verify we're in a git repo
    try:
        run_git_command(["rev-parse", "--git-dir"])
    except SystemExit:
        print("ERROR: Not a git repository!", file=sys.stderr)
        sys.exit(1)
    
    data_dir = repo_root / "data"
    output_file = data_dir / "commits.json"
    
    data_dir.mkdir(exist_ok=True)
    
    commits = get_commits(limit=100)
    
    for commit in commits:
        mapped_files = []
        for file_path in commit["changed_files"]:
            mapped = map_file_to_site_url(file_path)
            if mapped:
                mapped["file_path"] = file_path
                mapped_files.append(mapped)
        
        commit["changed_files_mapped"] = mapped_files
    
    with open(output_file, "w") as f:
        json.dump(commits, f, indent=2)
    
    print(f"Generated {len(commits)} commits data at {output_file}")

if __name__ == "__main__":
    main()
