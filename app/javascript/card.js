const pay = () => {
  const payjp = Payjp('pk_test_d3f44b484c80f9c20681efee')
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  const form = document.getElementById('button')
  form.addEventListener("submit", (e) =>{
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;
        const renderDom = document.getElementById("button");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        debugger;
      }
      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();
      document.getElementById("button").submit();
    });
    e.preventDefault();
  });
};

window.addEventListener("turbo:load", pay);