FROM golang:1.12 as builder
RUN apt install git -y
RUN apt-get install python-software-properties
RUN apt-get install software-properties-common
RUN add-apt-repository ppa:alex-p/tesseract-ocr && apt-get update 
RUN apt install tesseract-ocr
ENV GO111MODULE=on
COPY . /go/src/SHUVolunteerBE
WORKDIR /go/src/SHUVolunteerBE
RUN go get && go build -o SHUVolunteerBE .


FROM alpine
COPY --from=builder /go/src/SHUVolunteerBE/SHUVolunteerBE .
CMD ["./SHUVolunteerBE"]
EXPOSE 8000
