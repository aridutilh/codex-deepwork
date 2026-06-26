const morphWord = document.querySelector("[data-morph-word]");

if (morphWord) {
  const finalText = morphWord.dataset.morphWord || morphWord.textContent;
  const glyphs = ["D", "e", "p", "w", "o", "r", "k", "/", "\\", "|", "_", "-", "+", "*", ":", ".", "~"];
  let tick = 0;

  window.setInterval(() => {
    tick += 1;

    const letters = Array.from(finalText, (letter, index) => {
      const wave = (tick + index * 2) % 18;
      if (wave < 4) {
        return glyphs[(tick + index * 5) % glyphs.length];
      }
      if (wave === 4) {
        return letter.toLowerCase();
      }
      return letter;
    });

    morphWord.textContent = letters.join("");
  }, 95);
}
