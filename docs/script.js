const asciiLogo = document.querySelector("[data-ascii-logo]");

if (asciiLogo) {
  const frames = [
    "[...]",
    "[::]",
    "[//]",
    "[==]",
    "[++]",
    "[##]",
    "{..}",
    "{<>}",
    "<//>",
    "<==>",
    "::_",
    "::|",
    "::/",
    "::-",
  ];

  let frameIndex = 0;

  window.setInterval(() => {
    frameIndex = (frameIndex + 1) % frames.length;
    asciiLogo.textContent = frames[frameIndex];
  }, 140);
}
