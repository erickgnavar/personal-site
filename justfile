fmt:
    uvx djlint==1.36.4 --profile=golang --indent 2 --reformat layouts/

check:
    uvx djlint==1.36.4 --profile=golang --indent 2 layouts/
