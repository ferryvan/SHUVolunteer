FROM golang:1.12-alpine as builder
RUN apk add git
ENV GO111MODULE=on
COPY . /go/src/SHUVolunteerBE
WORKDIR /go/src/SHUVolunteerBE
RUN go get && go build -o SHUVolunteerBE .


FROM alpine
COPY --from=builder /go/src/SHUVolunteerBEy/SHUVolunteerBE .
CMD ["./SHUVolunteerBE"]
EXPOSE 8086
