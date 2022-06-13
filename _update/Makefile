

all:
	./release-md.sh > DOWNLOADS.md
	./release-html.sh > downloads.html
	./release-latest.sh > latest.html
	./release-json.sh > latest.json; cp latest.json latest-ecg.json; cp latest.json latest-dashboard.json

copy:
	cp DOWNLOADS.md ..
	cp downloads.html latest.html ../_includes


clean:
	-rm D*.md *.html *.json
