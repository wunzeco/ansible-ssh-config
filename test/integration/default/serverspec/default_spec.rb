require 'spec_helper'

ssh_config_user = 'ogonna'
ssh_config_ssh_dir = "/home/#{ssh_config_user}/.ssh"

describe file(ssh_config_ssh_dir) do
  it { should be_directory }
  it { should be_mode 700 }
  it { should be_owned_by ssh_config_user }
end

describe file("#{ssh_config_ssh_dir}/config") do
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by ssh_config_user }
end

describe command("grep ^Host #{ssh_config_ssh_dir}/config | wc -l") do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match '2' }
end
