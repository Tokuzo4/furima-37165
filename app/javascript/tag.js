document.addEventListener("DOMContentLoaded", () => {
  const itemNameInput = document.querySelector("#post_form_item_name");
    if (itemNameInput){
      const inputElement = document.getElementById("post_form_item_name");
      inputElement.addEventListener("input", () => {
        const keyword = document.getElementById("post_form_item_name").value;
        const XHR = new XMLHttpRequest();
        XHR.open("GET", `/items/search/?keyword=${keyword}`, true);
        XHR.responseType = "json";
        XHR.send();
        XHR.onload = () => {
          const searchResult = document.getElementById("search-result");
          searchResult.innerHTML = "";
          if (XHR.response) {
            const itemName = XHR.response.keyword;
            itemName.forEach((item) => {
              const childElement = document.createElement("div");
              childElement.setAttribute("class", "child");
              childElement.setAttribute("id", item.id);
              childElement.innerHTML = item.item_name;
              searchResult.appendChild(childElement);
              const clickElement = document.getElementById(item.id);
              clickElement.addEventListener("click", () => {
                document.getElementById("post_form_item_name").value = clickElement.textContent;
                clickElement.remove();
              });
            });
          };
        };
      });
    };
  });