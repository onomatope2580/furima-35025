const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form")
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formData = new FormData(form);

    const card = {
      number: formData.get("purchase_address[card_number]"),
      exp_month: formData.get("purchase_address[card_exp_month]"),
      exp_year: `20${formData.get("purchase_address[card_exp_year]")}`,
      cvc: formData.get("purchase_address[card_cvc]"),
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const token000 = `<input value=${token} name='token' type="hidden">`;
        form.insertAdjacentHTML("beforeend", token000);
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");

      form.submit();
    });
  });
};

window.addEventListener("load", pay);