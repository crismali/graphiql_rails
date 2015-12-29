describe('GraphiqlRails', function() {
  var subject;

  beforeEach(function() {
    subject = new GraphiqlRails();
  });

  afterEach(function() {
    history.replaceState(null, null, '?');
  });

  describe('constructor', function() {
    beforeEach(function() {
      history.replaceState(null, null, '?query=a_query&variables=a_variable');
      subject = new GraphiqlRails();
    });

    it('sets query based on query parameters', function() {
      expect(subject.query).to.equal('a_query');
    });

    it('sets variables based on query parameters', function() {
      expect(subject.variables).to.equal('a_variable');
    });
  });

  describe('#onEditQuery', function() {
    var newQuery;

    beforeEach(function() {
      newQuery = 'something new';
      stub(subject, 'updateURL');
      var onEditQuery = subject.onEditQuery;
      onEditQuery(newQuery);
    });

    it('sets the new query as the query', function() {
      expect(subject.query).to.equal(newQuery);
    });

    it('updates the url', function() {
      expect(subject.updateURL.called).to.equal(true);
    });
  });

  describe('#onEditVariables', function() {
    var newVariables;

    beforeEach(function() {
      newVariables = 'something new';
      stub(subject, 'updateURL');
      var onEditVariables = subject.onEditVariables;
      onEditVariables(newVariables);
    });

    it('sets the new variables as the variables', function() {
      expect(subject.variables).to.equal(newVariables);
    });

    it('updates the url', function() {
      expect(subject.updateURL.called).to.equal(true);
    });
  });

  describe('#updateURL', function() {
    beforeEach(function() {
      subject.query = 'a_query';
      subject.variables = 'a_variable';
      var updateURL = subject.updateURL;
      updateURL();
    });

    it('sets query and variables in the url', function() {
      expect(window.location.search).to.equal('?query=a_query&variables=a_variable');
    });
  });
});
