FROM jitesoft/tesseract-ocr as builder
RUN apt-get update && apt install git -y && apt install golang -y
ENV GO111MODULE=on GOPATH=/go/src/
COPY . /go/src/SHUVolunteer
WORKDIR /go/src/SHUVolunteer
RUN go get && go build -o SHUVolunteer .

FROM alpine
COPY --from=builder /go/src/SHUVolunteer/SHUVolunteer .
CMD ["./SHUVolunteer"]
EXPOSE 8000
