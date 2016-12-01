//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require_tree

// Gestion de mes offres alert

$("#location_false").click(function() {
  alert("Vous avez enlevé votre velo de la location");
  }
);

$("#location_good").click(function() {
  alert("Vous avez mis votre velo en location");
  }
);


// Gestion du status de mes offres

$('.datepicker').datepicker({
    format: 'dd/mm/yyyy',
    startDate: '-3d'
});

