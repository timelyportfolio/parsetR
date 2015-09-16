HTMLWidgets.widget({

  name: 'parset',

  type: 'output',

  initialize: function(el, width, height) {

    return {}

  },

  renderValue: function(el, x, instance) {

    // size based on container
    var width = el.getBoundingClientRect().width;
    var height = el.getBoundingClientRect().height;
    
    // empty container in case of dynamic/Shiny situation
    el.innerHTML = "";
    var parset = d3.parsets()
                  .width(width)
                  .height(height);
                  
    // set options for parset with x.options from R arguments
    Object.keys(x.options).forEach(
      function(ky){
        if(parset[ky]){
          parset[ky](x.options[ky]);
        }
      }
    )
    
    // convert data to array of objects/rows
    var data = HTMLWidgets.dataframeToD3(x.data);
    
    var vis = d3.select(el).append("svg")
                  .attr("width", width)
                  .attr("height", height);
    
    vis.datum(data).call(parset);
    
    instance.parset = parset;

  },

  resize: function(el, width, height, instance) {
    
  }

});
