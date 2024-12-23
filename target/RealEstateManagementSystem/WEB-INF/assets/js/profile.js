const soldInputs = document.querySelectorAll('.Sold input');
const soldButtons = document.querySelectorAll('.Sold button');

// soldInputs.forEach(input => input.style.visibility = 'hidden');
// soldButtons.forEach(button => button.style.visibility = 'hidden');

soldInputs.forEach(input => input.style.display = 'none');
soldButtons.forEach(button => button.style.display = 'none');

document.querySelectorAll('.Sold .statusImage').forEach(image => image.style.display = "block");

document.querySelectorAll('[id^="__"]').forEach(element => {
    element.addEventListener("click", function (){
        let propertyID = element.id.substring(2, element.id.length);
        console.log(propertyID);
        let usr = document.getElementById("_"+  propertyID).value;
        if(usr.trim().length === 0){
            alert("Enter a valid username");
            return;
        }

        window.location.href = '/containsUsername?usr=' + usr + '&propertyID=' + propertyID;
    });
});