import nasa.tsv


# for finding the url. go to a bash and cat tail nasa.tsv| uniq. to get the list of urls.
#| metadata type=hosts | table host

logfile = open("access.log", "r")

clean_log=[]

for line in logfile:
    try:
        # copy the URLS to an empty list.
        # We get the part between GET and HTTP
        clean_log.append(line[line.index("GET")+4:line.index("HTTP")])
    except:
        pass

counter = collections.Counter(clean_log)

# get the Top 50 most popular URLs
for count in counter.most_common(50):
    print(str(count[1]) + "\t" + str(count[0]))

logfile.close()
