require 'spec_helper'

describe "openslp" do
	describe 'on a Service Agent' do
		let(:params) {{ :scope => ['TEST_SCOPE'],
						:da_addresses => ['192.168.1.2','192.168.1.3']}}
		it { should contain_package('openslp')}
		it { should contain_service('slpd')}
		it do 
			should contain_file('/etc/slp.conf').with({
			'ensure' => 'present',
			'owner' => 'root',
    		'group' => 'root',
    		'mode' => '0644',
			})
			should contain_file('/etc/slp.conf').with_content(/^\s*net.slp.isDA = false/)
			should contain_file('/etc/slp.conf').with_content(/^\s*net.slp.useScopes = TEST_SCOPE/)
			should contain_file('/etc/slp.conf').with_content(/^\s*net.slp.DAAddresses = 192.168.1.2, 192.168.1.3/)
		end
	end

	describe 'on a Directory Agent' do
		let(:params) {{ :scope => ['TEST_SCOPE'],
						:da_addresses => ['192.168.1.2','192.168.1.3'],
						:is_da => true,
						:da_sync => true,
						:da_backup => true,}}
		it { should contain_package('openslp')}
		it { should contain_service('slpd')}
		it do 
			should contain_file('/etc/slp.conf').with({
			'ensure' => 'present',
			'owner' => 'root',
    		'group' => 'root',
    		'mode' => '0644',
			})
			should contain_file('/etc/slp.conf').with_content(/^\s*net.slp.isDA = true/)
			should contain_file('/etc/slp.conf').with_content(/^\s*net.slp.DASyncReg = true/)
			should contain_file('/etc/slp.conf').with_content(/^\s*net.slp.isDABackup = true/)
			should contain_file('/etc/slp.conf').with_content(/^\s*net.slp.useScopes = TEST_SCOPE/)
			should contain_file('/etc/slp.conf').with_content(/^\s*net.slp.DAAddresses = 192.168.1.2, 192.168.1.3/)
		end 
	end
end