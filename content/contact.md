---
title: "Contact"
description: "Contact Me"
meta: "false"
---

<!-- markdownlint-disable MD033 -->
<div id="contact-success" class="alert alert-success" hidden>
  Thanks. Your message was sent successfully.
</div>
<form id="contact-form" action="https://formspree.io/f/meepevqd" method="POST">

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
    <button type="submit">Send</button>
  </p>
</form>
<script>
  (function () {
    var form = document.getElementById("contact-form");
    form.addEventListener("submit", function (e) {
      e.preventDefault();
      var data = new FormData(form);
      fetch(form.action, {
        method: "POST",
        body: data,
        headers: { Accept: "application/json" },
      }).then(function (response) {
        if (response.ok) {
          document.getElementById("contact-success").hidden = false;
          form.reset();
        } else {
          alert("Something went wrong. Please try again.");
        }
      }).catch(function () {
        alert("Something went wrong. Please try again.");
      });
    });
  })();
</script>
