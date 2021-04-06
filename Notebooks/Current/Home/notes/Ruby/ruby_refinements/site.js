"use strict";

window.addEventListener("DOMContentLoaded", function() {
  let portfolio = document.getElementsByClassName("team-portfolio")[0];
  let avatar = null;

  if (typeof portfolio === "undefined") {
    return;
  }

  avatar = portfolio.getElementsByClassName("avatar")[0];

  if (typeof avatar === "undefined") {
    return;
  }

  avatar.addEventListener("mouseover", function () {
    this.src = this.dataset.actual;
  });

  avatar.addEventListener("mouseout", function () {
    this.src = this.dataset.artistic;
  });
});
