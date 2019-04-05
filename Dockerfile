FROM jitesoft/tesseract-ocr as builder
RUN apt install git
RUN apt install golang
ENV GO111MODULE=on
COPY . /go/src/SHUVolunteerBE
WORKDIR /go/src/SHUVolunteerBE
RUN go get && go build -o SHUVolunteerBE .

FROM alpine
COPY --from=builder /go/src/SHUVolunteerBE/SHUVolunteerBE .
CMD ["./SHUVolunteerBE"]
EXPOSE 8000
