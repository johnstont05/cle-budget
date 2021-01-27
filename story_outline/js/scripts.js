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
      var json_file = 'energy.json';
  }
  $.getJSON(json_file, function(data) {
    document.getElementById("category").innerHTML = data.category;
    document.getElementById("category1").innerHTML = data.category;
    // document.getElementById("category2").innerHTML = data.category;
    document.getElementById("fund1").innerHTML = data.funds;
    // document.getElementById("fund2").innerHTML = data.funds;
    document.getElementById("fund_description").innerHTML = data.fund_description;
    // document.getElementById("percent").innerHTML = data.percent;
    document.getElementById("spending").innerHTML = data.spending;
    document.getElementById("vision").innerHTML = data.vision;

    // TODO: Uncomment this code and let the sankey's load individually
    // $(function() {
    //   document.getElementById("sankey-energy").style.display = "hidden";
    //   document.getElementById("sankey-police").style.visibility = "hidden";
    //   document.getElementById("sankey-roads").style.visibility = "hidden";
    //   document.getElementById("sankey-judicial").style.visibility = "hidden";
    //
    //   if(data.sankey_json == "sankey-police.html"){
    //     document.getElementById("sankey-police").style.visibility = "visible";
    //   }else if(data.sankey_json == "sankey-energy.html"){
    //     document.getElementById("sankey-energy").style.visibility = "visible";
    //   }else if(data.sankey_json == "sankey-roads.html"){
    //     document.getElementById("sankey-roads").style.visibility = "visible";
    //   }else if(data.sankey_json == "sankey-judicial.html"){
    //     document.getElementById("sankey-judicial").style.visibility = "visible";
    //   }
    // });
  }).error(function() {
    console.log('error');
  });
}

var load_sankey = function(event){
  $("#sankey-energy").load("sankey-energy.html");
  $("#sankey-judicial").load("sankey-judicial.html");
  $("#sankey-roads").load("sankey-roads.html");
  $("#sankey-police").load("sankey-police.html");
  buttonFunction();
}

window.onload = load_sankey;
