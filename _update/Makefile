

all:
	./release-md.sh > DOWNLOADS.md
	./release-html.sh > downloads.html
	./release-latest.sh > latest.html
	./release-json.sh > latest.json

copy:
	cp DOWNLOADS.md latest.json ..
	cp downloads.html latest.html ../_includes


clean:
	-rm *.md *.html
