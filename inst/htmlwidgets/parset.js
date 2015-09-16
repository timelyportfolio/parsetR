HTMLWidgets.widget({

  name: 'parset',

  type: 'output',

  initialize: function(el, width, height) {

    return {}

  },

  renderValue: function(el, x, instance) {

    var parset = d3.parsets();
    // convert data to array of objects/rows
    var data = HTMLWidgets.dataframeToD3(x.data);
    
    // empty container in case of dynamic/Shiny situation
    el.innerHTML = "";
    
    var vis = d3.select(el).append("svg");
    
    vis.datum(data).call(parset);
    
  },

  resize: function(el, width, height, instance) {

  }

});
