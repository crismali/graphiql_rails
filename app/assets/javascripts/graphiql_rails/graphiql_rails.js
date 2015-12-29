(function(global) {
  function GraphiqlRails() {
    _.bindAll(this);
    var queryParams = URI.parseQuery(window.location.search);
    this.query = queryParams.query;
    this.variables = queryParams.variables;
  }

  GraphiqlRails.prototype = {
    onEditQuery: function(newQuery) {
      this.query = newQuery;
      this.updateURL();
    },

    onEditVariables: function(newVariables) {
      this.variables = newVariables;
      this.updateURL();
    },

    updateURL: function() {
      var newState = URI.buildQuery({
        query: this.query,
        variables: this.variables
      });
      history.replaceState(null, null, '?' + newState);
    }
  };

  global.GraphiqlRails = GraphiqlRails;
})(this);
