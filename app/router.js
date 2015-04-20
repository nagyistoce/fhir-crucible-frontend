import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.resource('servers', function() {
    this.route('show', { path: ':server_id' });
  });

  this.resource('test_runs', function() {
    this.route('show', { path: ':test_run_id' });
  });

  this.resource('multiservers', function() {
    this.route('show', { path: ':multiserver_id' });
  });

  this.resource('users', function() {
    this.route('sign-up');
    this.route('login');
  });
});

export default Router;
