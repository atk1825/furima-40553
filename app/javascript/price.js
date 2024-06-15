function tax() {
  const price = document.getElementById("item-price");
  price.addEventListener('input',() =>{
    const priceValue = parseFloat(price.value) || 0;
    const priceTax = priceValue * 0.1;
    const addTax  = document.getElementById("add-tax-price");
    addTax.innerHTML = `${Math.floor(priceTax)}`;

    const priceProfit = priceValue - priceTax;
    const addProfit  = document.getElementById("profit");
    addProfit.innerHTML =`${Math.floor(priceProfit)}`;
  })  
}
window.addEventListener('load', tax);