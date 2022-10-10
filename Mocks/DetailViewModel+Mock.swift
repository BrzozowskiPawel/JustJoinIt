//
//  DetailViewModel+Mock.swift
//  JustJoinIt
//
//  Created by Paweł Brzozowski on 10/10/2022.
//

import Foundation

extension DetailViewModel {
    static func mockDetailOffer() -> DetailOffer {
        return DetailOffer(
            apply_body: nil,
            title: "DevOps Engineer",
            street: "Plac Solny 15",
            city: "Wrocław",
            country_code: "PL",
            address_text: "Plac Solny 15, Wrocław",
            marker_icon: "devops",
            workplace_type: "remote",
            company_name: "BaseLinker",
            company_url: "https://baselinker.com",
            company_size: "80+",
            experience_level: "mid",
            latitude: "51.108982",
            longitude: "17.02919",
            apply_url: "https://baselinker.elevato.net/en/devops-engineer-remote-work,ja,87?source=1009",
            published_at: "2022-10-10T15:30:39.862Z",
            remote_interview: true,
            video_key: nil,
            video_provider: nil,
            open_to_hire_ukrainians: true,
            future_consent_title: "Processing data in future recruitment",
            future_consent: "Wyrażam zgodę na przetwarzanie moich danych osobowych dla celów przyszłych rekrutacji.",
            information_clause: "Administratorem Twoich danych osobowych jest BaseLinker sp. z o.o. z siedzibą we Wrocławiu, adres: Plac Solny 15, 50-062 Wrocław, nr KRS 0000795513. Dane przetwarzamy:\r\nw celu podjęcia czynności niezbędnych do zawarcia umowy zatrudnienia, na Twoje żądanie,\r\nw zakresie wynikającym z przepisów prawa, w celu realizacji procesu rekrutacyjnego,\r\njeśli jest to uzasadnione - w celu realizacji prawnie uzasadnionego interesu Administratora polegającego na ustaleniu, dochodzeniu lub obronie przed takimi roszczeniami,\r\nw celach wskazanych w treści, w razie ich wyrażenia.\r\nUWAGA: udostępnienie informacji przekraczających minimalny zakres danych regulowany prawem pracy to wyraźne działanie równoznaczne z wyrażeniem zgody na przetwarzanie tych danych w celu przeprowadzenia rekrutacji. Ich podanie nie ma wpływu na możliwość udziału w rekrutacji. Podobnie, wskazanie osób udzielających referencji to wyraźne działanie oznaczające zgodę na kontakt z nimi.\r\nInformujemy o możliwości wycofania zgody w dowolnym momencie, poprzez kontakt pod adres wskazany powyżej.\r\nW sytuacjach przewidzianych prawem, przysługuje Ci: prawo dostępu do swoich danych oraz otrzymania ich kopii, prawo do sprostowania (poprawiania) swoich danych, prawo do usunięcia danych osobowych, prawo do ograniczenia przetwarzania danych, prawo do przenoszenia danych - jeśli podstawą prawną ich przetwarzani a jest zgoda (art. 6 ust. 1 lit. a lub art. 9 ust. 2 lit. a RODO) lub umowa (art. 6 ust. 1 lit. b RODO), prawo do cofnięcia zgody na przetwarzanie danych, gdy stanowi ona podstawę przetwarzania danych (art. 6 ust. 1 lit. a RODO), przy czym nie ma to wpływu na przetwarzanie przed terminem cofnięcia, prawo wniesienia sprzeciwu wobec przetwarzania danych osobowych - jeśli podstawą prawną ich przetwarzania jest prawnie uzasadniony interes (art. 6 ust. 1 lit. f RODO).\r\nPełna treść klauzuli informacyjnej jest dostępna pod tym adresem: https://baselinker.com/pl-PL/kariera/",
            custom_consent_title: nil,
            custom_consent: nil,
            id: "baselinker-devops-engineer",
            tags: [""],
            body: "<div>BaseLinker to dynamicznie rozwijająca się firma z siedzibą we Wrocławiu. Tworzymy i utrzymujemy aplikacje SaaS dla e-commerce. Z naszego produktu korzysta codziennie ponad 18 000 firm. Jesteśmy na bardzo ciekawym etapie rozwoju. Działamy na kilku rynkach i idziemy po więcej :)<br><br>Każdy z nas jest inny, ale łączy nas zaangażowanie i dbałość o szczegóły. Do wszystkiego podchodzimy z dystansem i odrobiną humoru. Chcemy razem tworzyć fajne rzeczy, wspierać i rozwijać się.<br><br>Rozwijamy się międzynarodowo, nasze Zespoły pracują w Polsce, Czechach i Słowacji, Rumunii oraz Brazylii. Pracujemy w pełni zdalnie - od czasu do czasu spotykamy się we wrocławskim biurze. <br><br>O roli:<br><br>Poszukujemy Kandydata/Kandydatki na stanowisko DevOps Engineer, który/która zajmie się budową i wspieraniem narzędzi, procesów i infrastruktury umożliwiającej szybsze dostarczanie i skalowanie oprogramowania.<br><br><strong>Stack technologiczny: </strong>AWS, Linux, Nginx, MySQL, Redis, Terraform, Ansible, RabbitMQ, Docker, PHP<br><br><br><strong>Inne zadania:<br></strong><br>\n</div><ul>\n<li>monitorowanie dostępności i poprawnego działania aplikacji/infrastruktury</li>\n<li>tworzenie/rozbudowa infrastruktury</li>\n<li>automatyzacja reakcji na incydenty, analiza problemu</li>\n<li>zapewnienie dostępności, niezawodności i skalowalności infrastruktury aplikacji</li>\n<li>budowanie i wspieranie narzędzi CI/CD</li>\n<li>zapewnienie gromadzenia i monitorowania odpowiednich metryk</li>\n</ul><div>\n<br><strong>Oferujemy:<br></strong><br>\n</div><ul>\n<li>pracujemy nad własnym produktem - to my decydujemy o tym, jak się rozwijamy</li>\n<li>praca zdalna -  Ty wybierasz, skąd pracujesz</li>\n<li>praca w międzynarodowym środowisku</li>\n<li>współpraca projektowa z największymi markami z branży e-commerce</li>\n<li>tworzenie aplikacji używanej przez tysiące firm na całym świecie - pracujemy z dużą ilości danych e-commerce w Polsce i nie tylko</li>\n<li>elastyczne godziny pracy </li>\n<li>swobodna i przyjazna atmosfera w pracy</li>\n<li>prywatna opieka medyczna (Luxmed) </li>\n<li>karta sportowa (Multisport)</li>\n<li>roczny budżet wiedzowy</li>\n</ul><div>\n<br><br><strong>Oczekiwania:<br></strong><br>\n</div><ul>\n<li>min.5-letnie doświadczeniem w pracy z praktykami DevOps, Continuous Integration oraz Continuous Delivery</li>\n<li>doświadczenie w pracy z AWS, projektach opartych o architekturę mikro-usługową i kolejek</li>\n<li>znajomość środowiska linux</li>\n<li>znajomość Docker, Terraform, Ansible</li>\n<li>średniozaawansowany angielski (B2)</li>\n<li>mile widziana znajomość PHP</li>\n<li>odporność na stres</li>\n<li>poczucie humoru</li>\n</ul>",
            company_logo_url: "https://bucket.justjoin.it/offers/company_logos/original/baef3035d31c3a9bfa6d0b6619665f554151d1fc.png?1665415781",
            banner_url: nil,
            skills: [
                Skill(
                    name: "Git",
                    lavel: 3),
                Skill(
                    name: "JIRA",
                    lavel: 3),
                Skill(
                    name: "Swift",
                    lavel: 3)],
            remote: true,
            employment_types: [
                EmploymentType(
                    type: "b2b",
                    salary: Salary(
                        from: 11000,
                        to: 20600,
                        currency: "PLN")),
                EmploymentType(
                    type: "permanent",
                    salary: Salary(
                        from: 8000,
                        to: 15000,
                        currency: "PLN"))],
            multilocation: [
                Location(
                    city: "Poznań",
                    slug: "aleja Grunwaldzka 415",
                    street: "lufthansa-systems-ios-developer-ddl"),
                Location(
                    city: "Gdańsk",
                    slug: "aleja Grunwaldzka 415",
                    street: "lufthansa-systems-ios-developer-ddl"),
                Location(
                    city: "Warszawa",
                    slug: "aleja Grunwaldzka 415",
                    street: "lufthansa-systems-ios-developer-ddl"),
                Location(
                    city: "Kraków",
                    slug: "aleja Grunwaldzka 415",
                    street: "lufthansa-systems-ios-developer-ddl")])
    }
    static func mockVM() -> DetailViewModel {
        return DetailViewModel(offer: self.mockDetailOffer())
    }
}
