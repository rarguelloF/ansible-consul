require_relative 'spec_helper'

describe service('consul') do
	it { should be_enabled }
	it { should be_running }
end

describe file('/etc/consul/config.json') do
	it { should exist }
	it { should be_file }
	it { should be_owned_by 'consul' }
	it { should be_grouped_into 'consul' }
	it { should be_mode 644 }
end

describe file('/var/lib/consul') do
	it { should exist }
	it { should be_directory }
	it { should be_owned_by 'consul' }
	it { should be_grouped_into 'consul' }
	it { should be_mode 755 }
end

describe port(8500) do
	it { should be_listening }
end