// const agifyApiUrl = "https://wagon-dictionary.herokuapp.com/autocomplete/";
// console.log(fetch(agifyApiUrl));


const input = document.querySelector('#search');
const results = document.querySelector('#results');

const drawResponseList = (data) => {
  results.innerHTML = '';
  data.words.forEach((word) => {
    results.insertAdjacentHTML('beforeend', `<li>${word}</li>`);
  });
};

// const autocomplete = (e) => {
//   fetch(`https://wagon-dictionary.herokuapp.com/autocomplete/${e.target.value}`)
//     .then(response => response.json())
//     .then(data => drawResponseList(data));
// };

// input.addEventListener('keyup', autocomplete);
input.addEventListener('keyup');
