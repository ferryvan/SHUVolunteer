FROM golang:1.12-alpine as builder
RUN /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
RUN brew install tesseract
RUN brew install git
ENV GO111MODULE=on
COPY . /go/src/SHUVolunteerBE
WORKDIR /go/src/SHUVolunteerBE
RUN go get && go build -o SHUVolunteerBE .


FROM alpine
COPY --from=builder /go/src/SHUVolunteerBE/SHUVolunteerBE .
CMD ["./SHUVolunteerBE"]
EXPOSE 8000
