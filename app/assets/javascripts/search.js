$(function(){
$('.head__in__up__search__btn--display').on("click", function(e){
  let input = $('.head__in__up__search__txt').val();
  e.preventDefault();
  console.log(input);
});
});