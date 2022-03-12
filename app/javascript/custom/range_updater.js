  let slide = document.querySelector(".slide");
  let slideValue = document.querySelector(".aqi-text");
  slideValue.innerHTML = slide.value;

  slide.addEventListener('input', function () {
    slideValue.innerHTML = this.value;
    this.setAttribute("aria-valuenow", this.value);
  });
