#!/bin/bash
mysql --user=postfix --password="{{ postfix_password }}" postfix << EOF
INSERT INTO \`postfix\`.\`virtual_domains\` (\`id\` ,\`name\`) VALUES('1', '{{ domain_name}}');
INSERT INTO \`postfix\`.\`virtual_users\` (\`id\`, \`domain_id\`, \`password\` , \`email\`, \`user\`) VALUES('1', '1', ENCRYPT('{{ domain_email_password }}', CONCAT('$6$', SUBSTRING(SHA(RAND()), -16))), '{{ domain_email }}', '{{ domain_email }}');
{% if domain_email_alias is defined %}
INSERT INTO \`postfix\`.\`virtual_aliases\` (\`id\`, \`domain_id\`, \`source\`, \`destination\`) VALUES('1', '1', '{{ domain_email_alias }}', '{{ domain_email }}');
{% endif %}
EOF