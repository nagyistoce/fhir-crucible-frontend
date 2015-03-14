import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.resource('tests');
  this.resource('servers', function() {
    this.route('new');
    this.route('show', { path: ':server_id' });
    this.route('results', { path: ':server_id/results' });
  });
  this.resource('test_runs', function() {
    this.route('show', { path: ':test_run_id' });
  });
  this.resource('multiservers', function() {
    this.route('show', { path: ':multiserver_id' });
    this.route('results', { path: ':multiserver_id/results' });
  });
  this.resource('users', function() {
    this.route('show', { path: ':user_id' });
    this.route('sign-up');
    this.route('login');
  });
});

export default Router;
