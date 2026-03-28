---
title: "Contact"
description: "Contact Me"
meta: "false"
---

<!-- markdownlint-disable MD033 -->
<div id="contact-success" class="alert alert-success" hidden>
  Thanks. Your message was sent successfully.
</div>
<script>
  (function () {
    var params = new URLSearchParams(window.location.search);
    if (params.get("sent") === "1") {
      var msg = document.getElementById("contact-success");
      if (msg) msg.hidden = false;
    }
  })();
</script>
<form action="https://formspree.io/f/meepevqd" method="POST">

  <p>
    <label>Name: <br/><input type="text" name="name" /></label>   
  </p>
  <p>
    <label>Email: <br/><input type="email" name="email" /></label>
  </p>
  <p>
    <label>Message: <br/><textarea rows="8" name="message" style="width: 100%; height: 195px;"></textarea></label>
  </p>
  <p>
    <input type="text" name="_gotcha" style="display:none">
    <input type="hidden" name="_next" value="https://r15cookie.com/contact/?sent=1">
    <button type="submit">Send</button>
  </p>
</form>
