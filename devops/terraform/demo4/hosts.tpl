[app]
%{ for i in range(length(names)) ~}
%{ if split("-", names[i])[0] ==  "app" ~}
${names[i]}    ${addrs[i]}
%{ endif ~}
%{ endfor ~}

[db]
%{ for i in range(length(names)) ~}
%{ if split("-", names[i])[0] ==  "db" ~}
${names[i]}    ${addrs[i]}
%{ endif ~}
%{ endfor ~}