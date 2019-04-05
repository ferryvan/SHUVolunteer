FROM golang:1.12 as builder
RUN apt-get install git -y
RUN apt install libleptonica-dev
RUN apt install libtesseract-dev
ENV GO111MODULE=on
COPY . /go/src/SHUVolunteerBE
WORKDIR /go/src/SHUVolunteerBE
RUN go get && go build -o SHUVolunteerBE .


FROM alpine
COPY --from=builder /go/src/SHUVolunteerBE/SHUVolunteerBE .
CMD ["./SHUVolunteerBE"]
EXPOSE 8000
