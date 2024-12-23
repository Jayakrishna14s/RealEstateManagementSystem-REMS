let currentIndex = 0; // Keep track of the current slide

// Function to move the slide
function moveSlide(step) {
    const slides = document.querySelectorAll('.slide'); // Get all slide elements
    const totalSlides = slides.length; // Get the total number of slides

    // Update currentIndex based on the step (-1 for previous, 1 for next)
    currentIndex += step;

    // Loop through slides if currentIndex goes out of bounds
    if (currentIndex < 0) {
        currentIndex = totalSlides - 1; // Go to the last slide
    } else if (currentIndex >= totalSlides) {
        currentIndex = 0; // Go to the first slide
    }

    // Log the current index for debugging (optional)
    console.log('Current Index:', currentIndex);

    // Get the slide container and move it by changing the translateX value
    const slideContainer = document.querySelector('.slide-container');
    slideContainer.style.transform = `translateX(-${currentIndex * 100}%)`; // Slide effect
}

// Event listeners for the buttons to trigger the moveSlide function
document.querySelector('.prev').addEventListener('click', function() {
    moveSlide(-1); // Go to the previous slide
});

document.querySelector('.next').addEventListener('click', function() {
    moveSlide(1); // Go to the next slide
});