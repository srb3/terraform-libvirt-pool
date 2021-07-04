require 'tempfile'

expected_name = input('expected_name')
expected_type = input('expected_type')
expected_path = input('expected_path')

temp = Tempfile.new
temp << command("virsh pool-dumpxml #{expected_name}| xmllint -").stdout.gsub("\n", '').strip
temp.flush

describe xml(temp) do
  its('pool/name') { should eq [expected_name] }
  its('pool/@type') { should eq [expected_type] }
  its('pool/target/path') { should eq [expected_path] }
end
