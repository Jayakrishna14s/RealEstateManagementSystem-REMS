document.querySelector(".navbar > ul li:nth-child(2) a").addEventListener("click", function(event) {
    event.preventDefault();
});

document.addEventListener('DOMContentLoaded', () => {
    // Get all radio button groups
    const radios = document.querySelectorAll('input[type="radio"]');

    // Add event listeners to each radio button
    radios.forEach(radio => {
        radio.addEventListener('change', () => {
            applyFilters();
        });
    });

    function applyFilters() {
        // Get selected radio button values
        const assetType = document.querySelector('input[name="assetType"]:checked')?.value;
        const budgetRange = document.querySelector('input[name="budgetRange"]:checked')?.value;
        const state = document.querySelector('input[name="state"]:checked')?.value;

        // Get all elements with the class "result"
        const allResults = document.querySelectorAll('.HideAndSeek');

        allResults.forEach(el => {
            // Initially hide all elements
            el.style.display = 'none';

            // Check if element matches all selected criteria
            const matchesAsset = !assetType || el.classList.contains(assetType);
            const matchesBudget = !budgetRange || el.classList.contains(budgetRange);
            const matchesState = !state || el.classList.contains(state);

            if (matchesAsset && matchesBudget && matchesState) {
                el.style.display = 'grid'; // Show the matching element
            }
        });
    }
});





function getInfo(id) {
    const url = "/info?propertyId=" + id;
    window.location.href = url;
}