let DataClubs = [];
let DataNationality = [];
const comboNatio = document.getElementById('flag');
const comboClub = document.getElementById('club'); 
const submitBtn = document.getElementById('submitBtn');
const formulair = document.getElementById('formulaire');

document.addEventListener("DOMContentLoaded", () => {
    fetchdata();

    comboNatio.addEventListener('change', (event) => {
        console.log("Nationality:", event.target.value);
    });
    comboClub.addEventListener('change', (event) => {
        console.log("club:", event.target.value);
    });
    
});

const photo = document.getElementById('photo');
const face = document.getElementById('face');
// let comboNatio = document.getElementById('flag');

function fetchdata() {
    fetch('http://localhost/index.php')
        .then((response) => response.json())
        .then((data) => {
            console.log(data.data);

            DataNationality = Array.from(data.nationality);
            DataClubs = Array.from(data.clubs);
            console.log(DataClubs);
            console.log(DataNationality);
            
            DataNationality.forEach((natio) => {
                comboNatio.innerHTML += `<option value="${natio.Nat_id}">${natio.Nat_nom}</option>`;
            });

            DataClubs.forEach((clb) => {
                comboClub.innerHTML += `<option value="${clb.club_id}">${clb.club_nom}</option>`;
            });
        });
}
formulair.addEventListener('submit', async (e)=>{
     e.preventDefault();
     const infoplayer = {
        nom : document.getElementById('name').value,
        position: document.getElementById('position').value,
        photo: document.getElementById('face').getAttribute('src'),
        club : document.getElementById('club').value ,
        Nationality : document.getElementById('flag').value,
        rating : document.getElementById('rating').value ,
        pace_diving : document.getElementById('pace').value ,
        shooting_handling : document.getElementById('shooting').value,
        passing_kicking : document.getElementById('passing').value,
        dribbling_reflexes : document.getElementById('passing').value,
        defending_speed :document.getElementById('defending').value,
        physical_positioning : document.getElementById('physical').value
    }
    await fetch('http://localhost/index.php',{
              method : "POST",
              headers: { "Content-Type": "application/json" },
              body: JSON.stringify(infoplayer) 
    }) 

    // const responseData = await response.json()

    // console.log(responseData);
    
    // console.log(infoplayer);
})


photo.addEventListener('change', (event) => {
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function (e) {
            face.src = e.target.result;
        };
        reader.readAsDataURL(file);
    }
});
