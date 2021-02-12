window.addEventListener('load', () => {
  const  priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const tax = inputValue * 0.1
  const profit = inputValue - tax
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor( tax )
  const addProfitDom = document.getElementById("profit");
  addProfitDom.innerHTML = Math.floor( profit )
  console.log(addProfitDom);
})
});