// *************************************burger active*******

document.querySelector(".burger").addEventListener("click", function () {
    this.classList.toggle("active");
    document.querySelector("#navMenu").classList.toggle("open");
  });
  var menuItems = document.querySelectorAll("#navMenu a");
  menuItems.forEach(function (item) {
    item.addEventListener("click", function () {
      if (window.innerWidth <= 768) {
        document.querySelector(".burger").classList.remove("active");
        document.querySelector("#navMenu").classList.remove("open");
      }
    });
  });
  
  // *****************************progressBarContainer********
  window.onscroll = function () {
    updateProgressBar();
  };
  
  function updateProgressBar() {
    const winScroll = document.body.scrollTop || document.documentElement.scrollTop;
    const height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
    const scrolled = (winScroll / height) * 100;
    document.getElementById("progressBar").style.width = scrolled + "%";
  }