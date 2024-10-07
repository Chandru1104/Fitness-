function generateResult() {
    // Get values from the form
    const fitnessLevel = document.getElementById('fitness_level').value;
    const dietTimings = document.getElementById('diet_timings').value;
    const foodPreference = document.getElementById('food_preference').value;
    const agePreference = document.getElementById('age').value;

    // Construct the URL with query parameters
    const params = new URLSearchParams({
        fitness_level: fitnessLevel,
        diet_timings: dietTimings,
        food_preference: foodPreference,
        age_preference: agePreference
    });

    // Redirect to the result page with query parameters
    window.location.href = `result.html?${params.toString()}`;
}
