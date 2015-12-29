//= require support/sinon
//= require support/chai
//= require support/chai-jq-0.0.7
//= require graphiql_rails/uri
//= require graphiql_rails/lodash
//= require graphiql_rails/graphiql_rails
window.expect = chai.expect;

var stubs;

function stub(object, method, retVal) {
  var stub = sinon.stub(object, method).returns(retVal);
  stubs.push(stub);
  return stub;
}

beforeEach(function() {
  stubs = [];
});

afterEach(function() {
  stubs.forEach(function(stub) {
    stub.restore();
  });
});
