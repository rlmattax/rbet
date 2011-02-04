# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rbet}
  s.version = "1.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["See Contributing Section"]
  s.date = %q{2011-02-04}
  s.email = %q{ab@plumdistrict.com}
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc", "Rakefile", "lib/rbet", "lib/rbet/auth.rxml", "lib/rbet/client.rb", "lib/rbet/error.rb", "lib/rbet/list.rb", "lib/rbet/list_add.rxml", "lib/rbet/list_list_all.rxml", "lib/rbet/list_retrieve.rxml", "lib/rbet/list_retrieve_subscribers.rxml", "lib/rbet/list_send_email.rxml", "lib/rbet/ping.rxml", "lib/rbet/renderable.rb", "lib/rbet/subscriber.rb", "lib/rbet/subscriber_add.rxml", "lib/rbet/subscriber_delete.rxml", "lib/rbet/subscriber_retrieve.rxml", "lib/rbet/subscriber_retrieve_by_id.rxml", "lib/rbet/subscriber_update.rxml", "lib/rbet/tracker.rb", "lib/rbet/tracker_retrieve_summary.rxml", "lib/rbet/triggered_send.rb", "lib/rbet/triggered_send.rxml", "lib/rbet/version.rb", "lib/rbet.rb", "test/client_test.rb", "test/help.rb", "test/list_test.rb", "test/subscriber_test.rb", "test/templates", "test/templates/diagnostics_ping_success.rxml", "test/templates/list_add_failure.rxml", "test/templates/list_add_success.rxml", "test/templates/list_retrieve_all_success.rxml", "test/templates/list_retrieve_bylistid_success.rxml", "test/templates/subscriber_add_success.rxml", "test/templates/subscriber_retrieve_failed.rxml", "test/templates/subscriber_retrieve_success.rxml", "lib/rbet/email.rb"]
  s.homepage = %q{http://github.com/a-b/rbet}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5}
  s.summary = %q{A ruby wrapper for the Exact Target API}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
