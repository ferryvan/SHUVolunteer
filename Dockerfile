FROM golang:1.12 as builder
RUN apt-get install git -y
RUN apt-get install git -y
ENV GO111MODULE=on
COPY . /go/src/SHUVolunteerBE
WORKDIR /go/src/SHUVolunteerBE
RUN go get && go build -o SHUVolunteerBE .


FROM alpine
COPY --from=builder /go/src/SHUVolunteerBEy/SHUVolunteerBE .
CMD ["./SHUVolunteerBE"]
EXPOSE 8000
