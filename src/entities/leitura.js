class Leitura {
  constructor(id, user_id, book_id, status, review, rating) {
    this.id = id;
    this.user_id = user_id;
    this.book_id = book_id;
    this.status = status; // lido, lendo, quero_ler
    this.review = review;
    this.rating = rating;
  }
}

module.exports = Leitura;
