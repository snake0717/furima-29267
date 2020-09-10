function calculate() {
  const item_price = document.getElementById("item-price");
  　item_price.addEventListener("input", () => {
    const sum = document.getElementById("item-price").value;
    const tax = sum / 100 * 10;
    const profit = sum - tax;

    const add_tax_price = document.getElementById("add-tax-price");
    add_tax_price.innerHTML = tax;


    const add_profit_price = document.getElementById("profit");
    add_profit_price.innerHTML = profit;
   });
}
window.addEventListener("load", calculate);