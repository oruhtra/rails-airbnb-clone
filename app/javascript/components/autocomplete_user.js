function autocomplete_user() {
  document.addEventListener("DOMContentLoaded", function() {
    var eventlocation = document.getElementById('user_location');

    if (eventlocation) {
      var autocomplete = new google.maps.places.Autocomplete(eventlocation, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(eventlocation, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete_user };
