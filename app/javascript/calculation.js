function post (){
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  itemPrice.addEventListener("input", () => {
    const itemPriceValue = itemPrice.value;
    addTaxPrice.innerHTML = Math.floor(itemPriceValue * 0.1);
    profit.innerHTML = itemPriceValue - Math.floor(itemPriceValue * 0.1);
  });
}

window.addEventListener('load', post);