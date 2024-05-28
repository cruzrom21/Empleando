export interface Offer {
    idOffer: number,
    idUser: number,
    title: string,
    description: string,
    location: string,
    typeContract: string,
    salary: string,
    expirationDate: Date,
    createDate: Date,
    modifyDate: Date,
    company: string
}