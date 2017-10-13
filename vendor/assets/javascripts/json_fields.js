$(function() {

  // Add additional fields to the form
  $(document).on('click', '.add-json-fields', function() {
    $target = $("#"+$(this).data('target'));
    template = $target.find('.template:last').clone();
    if(typeof template === "undefined" || template === "") {
      return false;
    }
    //r = new RegExp($(this).data('target') + "\\[(\\d+)\\]", "g");
    //current_num = parseInt(r.exec(template)[1]);
    //new_template = template.replace(r, $(this).data('target')+'['+(current_num+1)+']');
    //$new_row = $('<div class="row template">'+new_template+'</div>');
    $target.append(template);
    return false;
  });

  // Remove the fields from the form
  $(document).on('click', '.remove-json-fields', function() {
    $(this).parents('.row.template:first').remove();
    return false;
  });
});
