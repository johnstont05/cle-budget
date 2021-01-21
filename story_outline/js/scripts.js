var buttonFunction = function(event) {
  switch (event) {
    case 'police':
      var json_file = "police.json";
      break;
    case 'judge':
      var json_file = "judges.json";
      break;
    case 'energy':
      var json_file = "energy.json";
      break;
    case 'road':
      var json_file = "road.json";
      break;
    default:
      var json_file = 'police.json';
  }
  $.getJSON(json_file, function(data) {
    document.getElementById("category").innerHTML = data.category;
    document.getElementById("category1").innerHTML = data.category;
    document.getElementById("category2").innerHTML = data.category;
    document.getElementById("fund1").innerHTML = data.funds;
    document.getElementById("fund2").innerHTML = data.funds;
    document.getElementById("fund_description").innerHTML = data.fund_description;
    document.getElementById("percent").innerHTML = data.percent;
    document.getElementById("spending").innerHTML = data.spending;
    document.getElementById("vision").innerHTML = data.vision;
    $(function() {
      $("#sankey").load(data.sankey_json);
    });
  }).error(function() {
    console.log('error');
  });
}
window.onload = buttonFunction;
