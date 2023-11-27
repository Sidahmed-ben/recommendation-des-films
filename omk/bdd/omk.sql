-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : lun. 27 nov. 2023 à 11:13
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `omk_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `api_key`
--

CREATE TABLE `api_key` (
  `id` varchar(32) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `credential_hash` varchar(60) NOT NULL,
  `last_ip` varbinary(16) DEFAULT NULL COMMENT '(DC2Type:ip_address)',
  `last_accessed` datetime DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `api_key`
--

INSERT INTO `api_key` (`id`, `owner_id`, `label`, `credential_hash`, `last_ip`, `last_accessed`, `created`) VALUES
('L9FGPCojmP9WpRcpG8ED0wd3wWa8dQq1', 1, 'omkKey', '$2y$10$rtWTAsJ8MMrBMvn5o4qyUOls02G1i1FDXG0y6pICYmsyfmpdZBlfW', 0x00000000000000000000000000000001, '2023-11-20 09:30:48', '2023-11-13 09:49:51');

-- --------------------------------------------------------

--
-- Structure de la table `asset`
--

CREATE TABLE `asset` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `media_type` varchar(255) NOT NULL,
  `storage_id` varchar(190) NOT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `alt_text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fulltext_search`
--

CREATE TABLE `fulltext_search` (
  `id` int(11) NOT NULL,
  `resource` varchar(190) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `title` longtext DEFAULT NULL,
  `text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fulltext_search`
--

INSERT INTO `fulltext_search` (`id`, `resource`, `owner_id`, `is_public`, `title`, `text`) VALUES
(4, 'items', 1, 1, 'Tesla Model S', 'Tesla Model S\nLa Tesla Model S est une berline électrique produite par Tesla, Inc. Elle est reconnue pour ses performances exceptionnelles, son autonomie élevée et son design élégant.\nhttps://photos.auto-moto.com/32/2023/09/photo_article/23999/120990/1200-L-tesla-model-s-et-model-x-grosse-baisse-de-prix-pour-la-berline-et-le-suv-lectriques.webp'),
(5, 'items', 1, 1, 'Audi Q5', 'Audi Q5\n L\'Audi Q5 est un SUV compact offrant un mélange équilibré de luxe, de performances et de polyvalence\nhttps://images.caradisiac.com/images/6/4/9/0/196490/S1-essai-audi-q5-sportback-40-tdi-2022-716971.jpg'),
(6, 'items', 1, 1, 'Ford Mustang GT', 'Ford Mustang GT\nLa Ford Mustang GT est une voiture de sport emblématique et puissante, avec un style rétro associé à des performances modernes\nhttps://i.ytimg.com/vi/PH0xGmz_D5Q/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLBznkNk6v4nvWXErzMN7bSLRFiRIw'),
(7, 'items', 1, 1, 'Sidahmed', 'Sidahmed\nSidahmed\nsidahmed@gmail.com'),
(8, 'items', 1, 1, 'Lorenzo', 'Lorenzo\nLorenzo\nlorenzo@gmail.com'),
(9, 'items', 1, 1, 'Fast And Furious 8', 'Fast And Furious 8'),
(10, 'items', 1, 1, 'Maman j\'ai raté l\'avion', 'Maman j\'ai raté l\'avion'),
(11, 'items', 1, 1, 'Note sidahmed', 'Note sidahmed\n10\nSidahmed\nFast And Furious 8'),
(12, 'items', 1, 1, 'Note Lorenzo', 'Note Lorenzo\n7\nLorenzo\nMaman j\'ai raté l\'avion'),
(13, 'items', 1, 1, 'Recommandation sidahmed', 'Recommandation sidahmed\nSidahmed\nMaman j\'ai raté l\'avion'),
(14, 'items', 1, 1, 'Recommandation Lorenzo', 'Recommandation Lorenzo\nLorenzo\nFast And Furious 8'),
(25, 'items', 1, 1, 'blabla', 'blabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla'),
(26, 'items', 1, 1, 'blabla', 'blabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla'),
(27, 'items', 1, 1, 'blabla', 'blabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla'),
(28, 'items', 1, 1, 'blabla', 'blabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla'),
(29, 'items', 1, 1, 'blabla', 'blabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla'),
(30, 'items', 1, 1, 'blabla', 'blabla\nblabla\nblabla'),
(31, 'items', 1, 1, 'blabla', 'blabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla'),
(32, 'items', 1, 1, 'blabla', 'blabla\nblabla\nblabla'),
(33, 'items', 1, 1, 'blabla', 'blabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla'),
(34, 'items', 1, 1, 'blabla', 'blabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla\nblabla');

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `primary_media_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item`
--

INSERT INTO `item` (`id`, `primary_media_id`) VALUES
(4, NULL),
(5, NULL),
(6, NULL),
(7, NULL),
(8, NULL),
(9, NULL),
(10, NULL),
(11, NULL),
(12, NULL),
(13, NULL),
(14, NULL),
(25, NULL),
(26, NULL),
(27, NULL),
(28, NULL),
(29, NULL),
(30, NULL),
(31, NULL),
(32, NULL),
(33, NULL),
(34, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `item_item_set`
--

CREATE TABLE `item_item_set` (
  `item_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `item_set`
--

CREATE TABLE `item_set` (
  `id` int(11) NOT NULL,
  `is_open` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `item_site`
--

CREATE TABLE `item_site` (
  `item_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job`
--

CREATE TABLE `job` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `class` varchar(255) NOT NULL,
  `args` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `log` longtext DEFAULT NULL,
  `started` datetime NOT NULL,
  `ended` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `ingester` varchar(255) NOT NULL,
  `renderer` varchar(255) NOT NULL,
  `data` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `source` longtext DEFAULT NULL,
  `media_type` varchar(255) DEFAULT NULL,
  `storage_id` varchar(190) DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `sha256` char(64) DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `has_original` tinyint(1) NOT NULL,
  `has_thumbnails` tinyint(1) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `lang` varchar(190) DEFAULT NULL,
  `alt_text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration`
--

INSERT INTO `migration` (`version`) VALUES
('20171128053327'),
('20180412035023'),
('20180919072656'),
('20180924033501'),
('20181002015551'),
('20181004043735'),
('20181106060421'),
('20190307043537'),
('20190319020708'),
('20190412090532'),
('20190423040354'),
('20190423071228'),
('20190514061351'),
('20190515055359'),
('20190729023728'),
('20190809092609'),
('20190815062003'),
('20200224022356'),
('20200226064602'),
('20200325091157'),
('20200326091310'),
('20200803000000'),
('20200831000000'),
('20210205101827'),
('20210225095734'),
('20210810083804'),
('20220718090449'),
('20220824103916'),
('20230601060113'),
('20230713101012');

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

CREATE TABLE `module` (
  `id` varchar(190) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `version` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `password_creation`
--

CREATE TABLE `password_creation` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `activate` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `password_creation`
--

INSERT INTO `password_creation` (`id`, `user_id`, `created`, `activate`) VALUES
('k4bMT5qVOTEwWKltiTtqSygQotl6NjWa', 2, '2023-11-27 09:21:46', 1);

-- --------------------------------------------------------

--
-- Structure de la table `property`
--

CREATE TABLE `property` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `property`
--

INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'title', 'Title', 'A name given to the resource.'),
(2, NULL, 1, 'creator', 'Creator', 'An entity primarily responsible for making the resource.'),
(3, NULL, 1, 'subject', 'Subject', 'The topic of the resource.'),
(4, NULL, 1, 'description', 'Description', 'An account of the resource.'),
(5, NULL, 1, 'publisher', 'Publisher', 'An entity responsible for making the resource available.'),
(6, NULL, 1, 'contributor', 'Contributor', 'An entity responsible for making contributions to the resource.'),
(7, NULL, 1, 'date', 'Date', 'A point or period of time associated with an event in the lifecycle of the resource.'),
(8, NULL, 1, 'type', 'Type', 'The nature or genre of the resource.'),
(9, NULL, 1, 'format', 'Format', 'The file format, physical medium, or dimensions of the resource.'),
(10, NULL, 1, 'identifier', 'Identifier', 'An unambiguous reference to the resource within a given context.'),
(11, NULL, 1, 'source', 'Source', 'A related resource from which the described resource is derived.'),
(12, NULL, 1, 'language', 'Language', 'A language of the resource.'),
(13, NULL, 1, 'relation', 'Relation', 'A related resource.'),
(14, NULL, 1, 'coverage', 'Coverage', 'The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant.'),
(15, NULL, 1, 'rights', 'Rights', 'Information about rights held in and over the resource.'),
(16, NULL, 1, 'audience', 'Audience', 'A class of entity for whom the resource is intended or useful.'),
(17, NULL, 1, 'alternative', 'Alternative Title', 'An alternative name for the resource.'),
(18, NULL, 1, 'tableOfContents', 'Table Of Contents', 'A list of subunits of the resource.'),
(19, NULL, 1, 'abstract', 'Abstract', 'A summary of the resource.'),
(20, NULL, 1, 'created', 'Date Created', 'Date of creation of the resource.'),
(21, NULL, 1, 'valid', 'Date Valid', 'Date (often a range) of validity of a resource.'),
(22, NULL, 1, 'available', 'Date Available', 'Date (often a range) that the resource became or will become available.'),
(23, NULL, 1, 'issued', 'Date Issued', 'Date of formal issuance (e.g., publication) of the resource.'),
(24, NULL, 1, 'modified', 'Date Modified', 'Date on which the resource was changed.'),
(25, NULL, 1, 'extent', 'Extent', 'The size or duration of the resource.'),
(26, NULL, 1, 'medium', 'Medium', 'The material or physical carrier of the resource.'),
(27, NULL, 1, 'isVersionOf', 'Is Version Of', 'A related resource of which the described resource is a version, edition, or adaptation.'),
(28, NULL, 1, 'hasVersion', 'Has Version', 'A related resource that is a version, edition, or adaptation of the described resource.'),
(29, NULL, 1, 'isReplacedBy', 'Is Replaced By', 'A related resource that supplants, displaces, or supersedes the described resource.'),
(30, NULL, 1, 'replaces', 'Replaces', 'A related resource that is supplanted, displaced, or superseded by the described resource.'),
(31, NULL, 1, 'isRequiredBy', 'Is Required By', 'A related resource that requires the described resource to support its function, delivery, or coherence.'),
(32, NULL, 1, 'requires', 'Requires', 'A related resource that is required by the described resource to support its function, delivery, or coherence.'),
(33, NULL, 1, 'isPartOf', 'Is Part Of', 'A related resource in which the described resource is physically or logically included.'),
(34, NULL, 1, 'hasPart', 'Has Part', 'A related resource that is included either physically or logically in the described resource.'),
(35, NULL, 1, 'isReferencedBy', 'Is Referenced By', 'A related resource that references, cites, or otherwise points to the described resource.'),
(36, NULL, 1, 'references', 'References', 'A related resource that is referenced, cited, or otherwise pointed to by the described resource.'),
(37, NULL, 1, 'isFormatOf', 'Is Format Of', 'A related resource that is substantially the same as the described resource, but in another format.'),
(38, NULL, 1, 'hasFormat', 'Has Format', 'A related resource that is substantially the same as the pre-existing described resource, but in another format.'),
(39, NULL, 1, 'conformsTo', 'Conforms To', 'An established standard to which the described resource conforms.'),
(40, NULL, 1, 'spatial', 'Spatial Coverage', 'Spatial characteristics of the resource.'),
(41, NULL, 1, 'temporal', 'Temporal Coverage', 'Temporal characteristics of the resource.'),
(42, NULL, 1, 'mediator', 'Mediator', 'An entity that mediates access to the resource and for whom the resource is intended or useful.'),
(43, NULL, 1, 'dateAccepted', 'Date Accepted', 'Date of acceptance of the resource.'),
(44, NULL, 1, 'dateCopyrighted', 'Date Copyrighted', 'Date of copyright.'),
(45, NULL, 1, 'dateSubmitted', 'Date Submitted', 'Date of submission of the resource.'),
(46, NULL, 1, 'educationLevel', 'Audience Education Level', 'A class of entity, defined in terms of progression through an educational or training context, for which the described resource is intended.'),
(47, NULL, 1, 'accessRights', 'Access Rights', 'Information about who can access the resource or an indication of its security status.'),
(48, NULL, 1, 'bibliographicCitation', 'Bibliographic Citation', 'A bibliographic reference for the resource.'),
(49, NULL, 1, 'license', 'License', 'A legal document giving official permission to do something with the resource.'),
(50, NULL, 1, 'rightsHolder', 'Rights Holder', 'A person or organization owning or managing rights over the resource.'),
(51, NULL, 1, 'provenance', 'Provenance', 'A statement of any changes in ownership and custody of the resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(52, NULL, 1, 'instructionalMethod', 'Instructional Method', 'A process, used to engender knowledge, attitudes and skills, that the described resource is designed to support.'),
(53, NULL, 1, 'accrualMethod', 'Accrual Method', 'The method by which items are added to a collection.'),
(54, NULL, 1, 'accrualPeriodicity', 'Accrual Periodicity', 'The frequency with which items are added to a collection.'),
(55, NULL, 1, 'accrualPolicy', 'Accrual Policy', 'The policy governing the addition of items to a collection.'),
(56, NULL, 3, 'affirmedBy', 'affirmedBy', 'A legal decision that affirms a ruling.'),
(57, NULL, 3, 'annotates', 'annotates', 'Critical or explanatory note for a Document.'),
(58, NULL, 3, 'authorList', 'list of authors', 'An ordered list of authors. Normally, this list is seen as a priority list that order authors by importance.'),
(59, NULL, 3, 'citedBy', 'cited by', 'Relates a document to another document that cites the\nfirst document.'),
(60, NULL, 3, 'cites', 'cites', 'Relates a document to another document that is cited\nby the first document as reference, comment, review, quotation or for\nanother purpose.'),
(61, NULL, 3, 'contributorList', 'list of contributors', 'An ordered list of contributors. Normally, this list is seen as a priority list that order contributors by importance.'),
(62, NULL, 3, 'court', 'court', 'A court associated with a legal document; for example, that which issues a decision.'),
(63, NULL, 3, 'degree', 'degree', 'The thesis degree.'),
(64, NULL, 3, 'director', 'director', 'A Film director.'),
(65, NULL, 3, 'distributor', 'distributor', 'Distributor of a document or a collection of documents.'),
(66, NULL, 3, 'editor', 'editor', 'A person having managerial and sometimes policy-making responsibility for the editorial part of a publishing firm or of a newspaper, magazine, or other publication.'),
(67, NULL, 3, 'editorList', 'list of editors', 'An ordered list of editors. Normally, this list is seen as a priority list that order editors by importance.'),
(68, NULL, 3, 'interviewee', 'interviewee', 'An agent that is interviewed by another agent.'),
(69, NULL, 3, 'interviewer', 'interviewer', 'An agent that interview another agent.'),
(70, NULL, 3, 'issuer', 'issuer', 'An entity responsible for issuing often informally published documents such as press releases, reports, etc.'),
(71, NULL, 3, 'organizer', 'organizer', 'The organizer of an event; includes conference organizers, but also government agencies or other bodies that are responsible for conducting hearings.'),
(72, NULL, 3, 'owner', 'owner', 'Owner of a document or a collection of documents.'),
(73, NULL, 3, 'performer', 'performer', NULL),
(74, NULL, 3, 'presentedAt', 'presented at', 'Relates a document to an event; for example, a paper to a conference.'),
(75, NULL, 3, 'presents', 'presents', 'Relates an event to associated documents; for example, conference to a paper.'),
(76, NULL, 3, 'producer', 'producer', 'Producer of a document or a collection of documents.'),
(77, NULL, 3, 'recipient', 'recipient', 'An agent that receives a communication document.'),
(78, NULL, 3, 'reproducedIn', 'reproducedIn', 'The resource in which another resource is reproduced.'),
(79, NULL, 3, 'reversedBy', 'reversedBy', 'A legal decision that reverses a ruling.'),
(80, NULL, 3, 'reviewOf', 'review of', 'Relates a review document to a reviewed thing (resource, item, etc.).'),
(81, NULL, 3, 'status', 'status', 'The publication status of (typically academic) content.'),
(82, NULL, 3, 'subsequentLegalDecision', 'subsequentLegalDecision', 'A legal decision on appeal that takes action on a case (affirming it, reversing it, etc.).'),
(83, NULL, 3, 'transcriptOf', 'transcript of', 'Relates a document to some transcribed original.'),
(84, NULL, 3, 'translationOf', 'translation of', 'Relates a translated document to the original document.'),
(85, NULL, 3, 'translator', 'translator', 'A person who translates written document from one language to another.'),
(86, NULL, 3, 'abstract', 'abstract', 'A summary of the resource.'),
(87, NULL, 3, 'argued', 'date argued', 'The date on which a legal case is argued before a court. Date is of format xsd:date'),
(88, NULL, 3, 'asin', 'asin', NULL),
(89, NULL, 3, 'chapter', 'chapter', 'An chapter number'),
(90, NULL, 3, 'coden', 'coden', NULL),
(91, NULL, 3, 'content', 'content', 'This property is for a plain-text rendering of the content of a Document. While the plain-text content of an entire document could be described by this property.'),
(92, NULL, 3, 'doi', 'doi', NULL),
(93, NULL, 3, 'eanucc13', 'eanucc13', NULL),
(94, NULL, 3, 'edition', 'edition', 'The name defining a special edition of a document. Normally its a literal value composed of a version number and words.'),
(95, NULL, 3, 'eissn', 'eissn', NULL),
(96, NULL, 3, 'gtin14', 'gtin14', NULL),
(97, NULL, 3, 'handle', 'handle', NULL),
(98, NULL, 3, 'identifier', 'identifier', NULL),
(99, NULL, 3, 'isbn', 'isbn', NULL),
(100, NULL, 3, 'isbn10', 'isbn10', NULL),
(101, NULL, 3, 'isbn13', 'isbn13', NULL),
(102, NULL, 3, 'issn', 'issn', NULL),
(103, NULL, 3, 'issue', 'issue', 'An issue number'),
(104, NULL, 3, 'lccn', 'lccn', NULL),
(105, NULL, 3, 'locator', 'locator', 'A description (often numeric) that locates an item within a containing document or collection.'),
(106, NULL, 3, 'numPages', 'number of pages', 'The number of pages contained in a document'),
(107, NULL, 3, 'numVolumes', 'number of volumes', 'The number of volumes contained in a collection of documents (usually a series, periodical, etc.).'),
(108, NULL, 3, 'number', 'number', 'A generic item or document number. Not to be confused with issue number.'),
(109, NULL, 3, 'oclcnum', 'oclcnum', NULL),
(110, NULL, 3, 'pageEnd', 'page end', 'Ending page number within a continuous page range.'),
(111, NULL, 3, 'pageStart', 'page start', 'Starting page number within a continuous page range.'),
(112, NULL, 3, 'pages', 'pages', 'A string of non-contiguous page spans that locate a Document within a Collection. Example: 23-25, 34, 54-56. For continuous page ranges, use the pageStart and pageEnd properties.'),
(113, NULL, 3, 'pmid', 'pmid', NULL),
(114, NULL, 3, 'prefixName', 'prefix name', 'The prefix of a name'),
(115, NULL, 3, 'section', 'section', 'A section number'),
(116, NULL, 3, 'shortDescription', 'shortDescription', NULL),
(117, NULL, 3, 'shortTitle', 'short title', 'The abbreviation of a title.'),
(118, NULL, 3, 'sici', 'sici', NULL),
(119, NULL, 3, 'suffixName', 'suffix name', 'The suffix of a name'),
(120, NULL, 3, 'upc', 'upc', NULL),
(121, NULL, 3, 'uri', 'uri', 'Universal Resource Identifier of a document'),
(122, NULL, 3, 'volume', 'volume', 'A volume number'),
(123, NULL, 4, 'mbox', 'personal mailbox', 'A  personal mailbox, ie. an Internet mailbox associated with exactly one owner, the first owner of this mailbox. This is a \'static inverse functional property\', in that  there is (across time and change) at most one individual that ever has any particular value for foaf:mbox.'),
(124, NULL, 4, 'mbox_sha1sum', 'sha1sum of a personal mailbox URI name', 'The sha1sum of the URI of an Internet mailbox associated with exactly one owner, the  first owner of the mailbox.'),
(125, NULL, 4, 'gender', 'gender', 'The gender of this Agent (typically but not necessarily \'male\' or \'female\').'),
(126, NULL, 4, 'geekcode', 'geekcode', 'A textual geekcode for this person, see http://www.geekcode.com/geek.html'),
(127, NULL, 4, 'dnaChecksum', 'DNA checksum', 'A checksum for the DNA of some thing. Joke.'),
(128, NULL, 4, 'sha1', 'sha1sum (hex)', 'A sha1sum hash, in hex.'),
(129, NULL, 4, 'based_near', 'based near', 'A location that something is based near, for some broadly human notion of near.'),
(130, NULL, 4, 'title', 'title', 'Title (Mr, Mrs, Ms, Dr. etc)'),
(131, NULL, 4, 'nick', 'nickname', 'A short informal nickname characterising an agent (includes login identifiers, IRC and other chat nicknames).'),
(132, NULL, 4, 'jabberID', 'jabber ID', 'A jabber ID for something.'),
(133, NULL, 4, 'aimChatID', 'AIM chat ID', 'An AIM chat ID'),
(134, NULL, 4, 'skypeID', 'Skype ID', 'A Skype ID'),
(135, NULL, 4, 'icqChatID', 'ICQ chat ID', 'An ICQ chat ID'),
(136, NULL, 4, 'yahooChatID', 'Yahoo chat ID', 'A Yahoo chat ID'),
(137, NULL, 4, 'msnChatID', 'MSN chat ID', 'An MSN chat ID'),
(138, NULL, 4, 'name', 'name', 'A name for some thing.'),
(139, NULL, 4, 'firstName', 'firstName', 'The first name of a person.'),
(140, NULL, 4, 'lastName', 'lastName', 'The last name of a person.'),
(141, NULL, 4, 'givenName', 'Given name', 'The given name of some person.'),
(142, NULL, 4, 'givenname', 'Given name', 'The given name of some person.'),
(143, NULL, 4, 'surname', 'Surname', 'The surname of some person.'),
(144, NULL, 4, 'family_name', 'family_name', 'The family name of some person.'),
(145, NULL, 4, 'familyName', 'familyName', 'The family name of some person.'),
(146, NULL, 4, 'phone', 'phone', 'A phone,  specified using fully qualified tel: URI scheme (refs: http://www.w3.org/Addressing/schemes.html#tel).'),
(147, NULL, 4, 'homepage', 'homepage', 'A homepage for some thing.'),
(148, NULL, 4, 'weblog', 'weblog', 'A weblog of some thing (whether person, group, company etc.).'),
(149, NULL, 4, 'openid', 'openid', 'An OpenID for an Agent.'),
(150, NULL, 4, 'tipjar', 'tipjar', 'A tipjar document for this agent, describing means for payment and reward.'),
(151, NULL, 4, 'plan', 'plan', 'A .plan comment, in the tradition of finger and \'.plan\' files.'),
(152, NULL, 4, 'made', 'made', 'Something that was made by this agent.'),
(153, NULL, 4, 'maker', 'maker', 'An agent that  made this thing.'),
(154, NULL, 4, 'img', 'image', 'An image that can be used to represent some thing (ie. those depictions which are particularly representative of something, eg. one\'s photo on a homepage).'),
(155, NULL, 4, 'depiction', 'depiction', 'A depiction of some thing.'),
(156, NULL, 4, 'depicts', 'depicts', 'A thing depicted in this representation.'),
(157, NULL, 4, 'thumbnail', 'thumbnail', 'A derived thumbnail image.'),
(158, NULL, 4, 'myersBriggs', 'myersBriggs', 'A Myers Briggs (MBTI) personality classification.'),
(159, NULL, 4, 'workplaceHomepage', 'workplace homepage', 'A workplace homepage of some person; the homepage of an organization they work for.'),
(160, NULL, 4, 'workInfoHomepage', 'work info homepage', 'A work info homepage of some person; a page about their work for some organization.'),
(161, NULL, 4, 'schoolHomepage', 'schoolHomepage', 'A homepage of a school attended by the person.'),
(162, NULL, 4, 'knows', 'knows', 'A person known by this person (indicating some level of reciprocated interaction between the parties).'),
(163, NULL, 4, 'interest', 'interest', 'A page about a topic of interest to this person.'),
(164, NULL, 4, 'topic_interest', 'topic_interest', 'A thing of interest to this person.'),
(165, NULL, 4, 'publications', 'publications', 'A link to the publications of this person.'),
(166, NULL, 4, 'currentProject', 'current project', 'A current project this person works on.'),
(167, NULL, 4, 'pastProject', 'past project', 'A project this person has previously worked on.'),
(168, NULL, 4, 'fundedBy', 'funded by', 'An organization funding a project or person.'),
(169, NULL, 4, 'logo', 'logo', 'A logo representing some thing.'),
(170, NULL, 4, 'topic', 'topic', 'A topic of some page or document.'),
(171, NULL, 4, 'primaryTopic', 'primary topic', 'The primary topic of some page or document.'),
(172, NULL, 4, 'focus', 'focus', 'The underlying or \'focal\' entity associated with some SKOS-described concept.'),
(173, NULL, 4, 'isPrimaryTopicOf', 'is primary topic of', 'A document that this thing is the primary topic of.'),
(174, NULL, 4, 'page', 'page', 'A page or document about this thing.'),
(175, NULL, 4, 'theme', 'theme', 'A theme.'),
(176, NULL, 4, 'account', 'account', 'Indicates an account held by this agent.'),
(177, NULL, 4, 'holdsAccount', 'account', 'Indicates an account held by this agent.'),
(178, NULL, 4, 'accountServiceHomepage', 'account service homepage', 'Indicates a homepage of the service provide for this online account.'),
(179, NULL, 4, 'accountName', 'account name', 'Indicates the name (identifier) associated with this online account.'),
(180, NULL, 4, 'member', 'member', 'Indicates a member of a Group'),
(181, NULL, 4, 'membershipClass', 'membershipClass', 'Indicates the class of individuals that are a member of a Group'),
(182, NULL, 4, 'birthday', 'birthday', 'The birthday of this Agent, represented in mm-dd string form, eg. \'12-31\'.'),
(183, NULL, 4, 'age', 'age', 'The age in years of some agent.'),
(184, NULL, 4, 'status', 'status', 'A string expressing what the user is happy for the general public (normally) to know about their current activity.'),
(190, 1, 6, 'username', 'username', NULL),
(191, 1, 6, 'email', 'email', NULL),
(192, 1, 6, 'hasUser', 'a comme utilisateur', NULL),
(193, 1, 6, 'hasMovie', 'a comme film', NULL),
(194, 1, 6, 'rating', 'rating', NULL),
(195, 1, 6, 'title', 'title', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `resource`
--

CREATE TABLE `resource` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `resource_template_id` int(11) DEFAULT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `resource_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource`
--

INSERT INTO `resource` (`id`, `owner_id`, `resource_class_id`, `resource_template_id`, `thumbnail_id`, `title`, `is_public`, `created`, `modified`, `resource_type`) VALUES
(4, 1, NULL, 3, NULL, 'Tesla Model S', 1, '2023-10-29 12:43:44', '2023-10-29 12:43:44', 'Omeka\\Entity\\Item'),
(5, 1, NULL, 3, NULL, 'Audi Q5', 1, '2023-10-29 12:44:58', '2023-10-29 12:44:58', 'Omeka\\Entity\\Item'),
(6, 1, NULL, 3, NULL, 'Ford Mustang GT', 1, '2023-10-29 12:46:40', '2023-10-29 12:46:40', 'Omeka\\Entity\\Item'),
(7, 1, 110, 10, NULL, 'Sidahmed', 1, '2023-10-30 20:51:36', '2023-10-30 20:59:41', 'Omeka\\Entity\\Item'),
(8, 1, 110, 10, NULL, 'Lorenzo', 1, '2023-10-30 20:52:38', '2023-10-30 20:59:28', 'Omeka\\Entity\\Item'),
(9, 1, 113, 7, NULL, 'Fast And Furious 8', 1, '2023-10-30 20:53:50', '2023-10-30 20:59:01', 'Omeka\\Entity\\Item'),
(10, 1, 113, 7, NULL, 'Maman j\'ai raté l\'avion', 1, '2023-10-30 20:54:34', '2023-10-30 20:58:42', 'Omeka\\Entity\\Item'),
(11, 1, 112, 8, NULL, 'Note sidahmed', 1, '2023-10-30 21:01:21', '2023-10-30 21:01:21', 'Omeka\\Entity\\Item'),
(12, 1, 112, 8, NULL, 'Note Lorenzo', 1, '2023-10-30 21:02:25', '2023-10-30 21:02:25', 'Omeka\\Entity\\Item'),
(13, 1, 111, 9, NULL, 'Recommandation sidahmed', 1, '2023-10-30 21:03:31', '2023-10-30 21:03:31', 'Omeka\\Entity\\Item'),
(14, 1, 111, 9, NULL, 'Recommandation Lorenzo', 1, '2023-10-30 21:04:20', '2023-10-30 21:04:20', 'Omeka\\Entity\\Item'),
(25, 1, NULL, NULL, NULL, 'blabla', 1, '2023-11-18 13:28:39', '2023-11-18 13:28:39', 'Omeka\\Entity\\Item'),
(26, 1, NULL, NULL, NULL, 'blabla', 1, '2023-11-18 13:29:04', '2023-11-18 13:29:04', 'Omeka\\Entity\\Item'),
(27, 1, NULL, NULL, NULL, 'blabla', 1, '2023-11-18 13:29:37', '2023-11-18 13:29:37', 'Omeka\\Entity\\Item'),
(28, 1, NULL, NULL, NULL, 'blabla', 1, '2023-11-18 13:29:41', '2023-11-18 13:29:41', 'Omeka\\Entity\\Item'),
(29, 1, NULL, NULL, NULL, 'blabla', 1, '2023-11-18 13:29:59', '2023-11-18 13:29:59', 'Omeka\\Entity\\Item'),
(30, 1, NULL, NULL, NULL, 'blabla', 1, '2023-11-18 13:30:06', '2023-11-18 13:30:06', 'Omeka\\Entity\\Item'),
(31, 1, NULL, NULL, NULL, 'blabla', 1, '2023-11-18 13:34:01', '2023-11-18 13:34:01', 'Omeka\\Entity\\Item'),
(32, 1, NULL, NULL, NULL, 'blabla', 1, '2023-11-18 13:34:02', '2023-11-18 13:34:02', 'Omeka\\Entity\\Item'),
(33, 1, NULL, NULL, NULL, 'blabla', 1, '2023-11-18 13:34:25', '2023-11-18 13:34:25', 'Omeka\\Entity\\Item'),
(34, 1, NULL, NULL, NULL, 'blabla', 1, '2023-11-20 09:07:39', '2023-11-20 09:07:39', 'Omeka\\Entity\\Item');

-- --------------------------------------------------------

--
-- Structure de la table `resource_class`
--

CREATE TABLE `resource_class` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_class`
--

INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'Agent', 'Agent', 'A resource that acts or has the power to act.'),
(2, NULL, 1, 'AgentClass', 'Agent Class', 'A group of agents.'),
(3, NULL, 1, 'BibliographicResource', 'Bibliographic Resource', 'A book, article, or other documentary resource.'),
(4, NULL, 1, 'FileFormat', 'File Format', 'A digital resource format.'),
(5, NULL, 1, 'Frequency', 'Frequency', 'A rate at which something recurs.'),
(6, NULL, 1, 'Jurisdiction', 'Jurisdiction', 'The extent or range of judicial, law enforcement, or other authority.'),
(7, NULL, 1, 'LicenseDocument', 'License Document', 'A legal document giving official permission to do something with a Resource.'),
(8, NULL, 1, 'LinguisticSystem', 'Linguistic System', 'A system of signs, symbols, sounds, gestures, or rules used in communication.'),
(9, NULL, 1, 'Location', 'Location', 'A spatial region or named place.'),
(10, NULL, 1, 'LocationPeriodOrJurisdiction', 'Location, Period, or Jurisdiction', 'A location, period of time, or jurisdiction.'),
(11, NULL, 1, 'MediaType', 'Media Type', 'A file format or physical medium.'),
(12, NULL, 1, 'MediaTypeOrExtent', 'Media Type or Extent', 'A media type or extent.'),
(13, NULL, 1, 'MethodOfInstruction', 'Method of Instruction', 'A process that is used to engender knowledge, attitudes, and skills.'),
(14, NULL, 1, 'MethodOfAccrual', 'Method of Accrual', 'A method by which resources are added to a collection.'),
(15, NULL, 1, 'PeriodOfTime', 'Period of Time', 'An interval of time that is named or defined by its start and end dates.'),
(16, NULL, 1, 'PhysicalMedium', 'Physical Medium', 'A physical material or carrier.'),
(17, NULL, 1, 'PhysicalResource', 'Physical Resource', 'A material thing.'),
(18, NULL, 1, 'Policy', 'Policy', 'A plan or course of action by an authority, intended to influence and determine decisions, actions, and other matters.'),
(19, NULL, 1, 'ProvenanceStatement', 'Provenance Statement', 'A statement of any changes in ownership and custody of a resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(20, NULL, 1, 'RightsStatement', 'Rights Statement', 'A statement about the intellectual property rights (IPR) held in or over a Resource, a legal document giving official permission to do something with a resource, or a statement about access rights.'),
(21, NULL, 1, 'SizeOrDuration', 'Size or Duration', 'A dimension or extent, or a time taken to play or execute.'),
(22, NULL, 1, 'Standard', 'Standard', 'A basis for comparison; a reference point against which other things can be evaluated.'),
(23, NULL, 2, 'Collection', 'Collection', 'An aggregation of resources.'),
(24, NULL, 2, 'Dataset', 'Dataset', 'Data encoded in a defined structure.'),
(25, NULL, 2, 'Event', 'Event', 'A non-persistent, time-based occurrence.'),
(26, NULL, 2, 'Image', 'Image', 'A visual representation other than text.'),
(27, NULL, 2, 'InteractiveResource', 'Interactive Resource', 'A resource requiring interaction from the user to be understood, executed, or experienced.'),
(28, NULL, 2, 'Service', 'Service', 'A system that provides one or more functions.'),
(29, NULL, 2, 'Software', 'Software', 'A computer program in source or compiled form.'),
(30, NULL, 2, 'Sound', 'Sound', 'A resource primarily intended to be heard.'),
(31, NULL, 2, 'Text', 'Text', 'A resource consisting primarily of words for reading.'),
(32, NULL, 2, 'PhysicalObject', 'Physical Object', 'An inanimate, three-dimensional object or substance.'),
(33, NULL, 2, 'StillImage', 'Still Image', 'A static visual representation.'),
(34, NULL, 2, 'MovingImage', 'Moving Image', 'A series of visual representations imparting an impression of motion when shown in succession.'),
(35, NULL, 3, 'AcademicArticle', 'Academic Article', 'A scholarly academic article, typically published in a journal.'),
(36, NULL, 3, 'Article', 'Article', 'A written composition in prose, usually nonfiction, on a specific topic, forming an independent part of a book or other publication, as a newspaper or magazine.'),
(37, NULL, 3, 'AudioDocument', 'audio document', 'An audio document; aka record.'),
(38, NULL, 3, 'AudioVisualDocument', 'audio-visual document', 'An audio-visual document; film, video, and so forth.'),
(39, NULL, 3, 'Bill', 'Bill', 'Draft legislation presented for discussion to a legal body.'),
(40, NULL, 3, 'Book', 'Book', 'A written or printed work of fiction or nonfiction, usually on sheets of paper fastened or bound together within covers.'),
(41, NULL, 3, 'BookSection', 'Book Section', 'A section of a book.'),
(42, NULL, 3, 'Brief', 'Brief', 'A written argument submitted to a court.'),
(43, NULL, 3, 'Chapter', 'Chapter', 'A chapter of a book.'),
(44, NULL, 3, 'Code', 'Code', 'A collection of statutes.'),
(45, NULL, 3, 'CollectedDocument', 'Collected Document', 'A document that simultaneously contains other documents.'),
(46, NULL, 3, 'Collection', 'Collection', 'A collection of Documents or Collections'),
(47, NULL, 3, 'Conference', 'Conference', 'A meeting for consultation or discussion.'),
(48, NULL, 3, 'CourtReporter', 'Court Reporter', 'A collection of legal cases.'),
(49, NULL, 3, 'Document', 'Document', 'A document (noun) is a bounded physical representation of body of information designed with the capacity (and usually intent) to communicate. A document may manifest symbolic, diagrammatic or sensory-representational information.'),
(50, NULL, 3, 'DocumentPart', 'document part', 'a distinct part of a larger document or collected document.'),
(51, NULL, 3, 'DocumentStatus', 'Document Status', 'The status of the publication of a document.'),
(52, NULL, 3, 'EditedBook', 'Edited Book', 'An edited book.'),
(53, NULL, 3, 'Email', 'EMail', 'A written communication addressed to a person or organization and transmitted electronically.'),
(54, NULL, 3, 'Event', 'Event', NULL),
(55, NULL, 3, 'Excerpt', 'Excerpt', 'A passage selected from a larger work.'),
(56, NULL, 3, 'Film', 'Film', 'aka movie.'),
(57, NULL, 3, 'Hearing', 'Hearing', 'An instance or a session in which testimony and arguments are presented, esp. before an official, as a judge in a lawsuit.'),
(58, NULL, 3, 'Image', 'Image', 'A document that presents visual or diagrammatic information.'),
(59, NULL, 3, 'Interview', 'Interview', 'A formalized discussion between two or more people.'),
(60, NULL, 3, 'Issue', 'Issue', 'something that is printed or published and distributed, esp. a given number of a periodical'),
(61, NULL, 3, 'Journal', 'Journal', 'A periodical of scholarly journal Articles.'),
(62, NULL, 3, 'LegalCaseDocument', 'Legal Case Document', 'A document accompanying a legal case.'),
(63, NULL, 3, 'LegalDecision', 'Decision', 'A document containing an authoritative determination (as a decree or judgment) made after consideration of facts or law.'),
(64, NULL, 3, 'LegalDocument', 'Legal Document', 'A legal document; for example, a court decision, a brief, and so forth.'),
(65, NULL, 3, 'Legislation', 'Legislation', 'A legal document proposing or enacting a law or a group of laws.'),
(66, NULL, 3, 'Letter', 'Letter', 'A written or printed communication addressed to a person or organization and usually transmitted by mail.'),
(67, NULL, 3, 'Magazine', 'Magazine', 'A periodical of magazine Articles. A magazine is a publication that is issued periodically, usually bound in a paper cover, and typically contains essays, stories, poems, etc., by many writers, and often photographs and drawings, frequently specializing in a particular subject or area, as hobbies, news, or sports.'),
(68, NULL, 3, 'Manual', 'Manual', 'A small reference book, especially one giving instructions.'),
(69, NULL, 3, 'Manuscript', 'Manuscript', 'An unpublished Document, which may also be submitted to a publisher for publication.'),
(70, NULL, 3, 'Map', 'Map', 'A graphical depiction of geographic features.'),
(71, NULL, 3, 'MultiVolumeBook', 'Multivolume Book', 'A loose, thematic, collection of Documents, often Books.'),
(72, NULL, 3, 'Newspaper', 'Newspaper', 'A periodical of documents, usually issued daily or weekly, containing current news, editorials, feature articles, and usually advertising.'),
(73, NULL, 3, 'Note', 'Note', 'Notes or annotations about a resource.'),
(74, NULL, 3, 'Patent', 'Patent', 'A document describing the exclusive right granted by a government to an inventor to manufacture, use, or sell an invention for a certain number of years.'),
(75, NULL, 3, 'Performance', 'Performance', 'A public performance.'),
(76, NULL, 3, 'Periodical', 'Periodical', 'A group of related documents issued at regular intervals.'),
(77, NULL, 3, 'PersonalCommunication', 'Personal Communication', 'A communication between an agent and one or more specific recipients.'),
(78, NULL, 3, 'PersonalCommunicationDocument', 'Personal Communication Document', 'A personal communication manifested in some document.'),
(79, NULL, 3, 'Proceedings', 'Proceedings', 'A compilation of documents published from an event, such as a conference.'),
(80, NULL, 3, 'Quote', 'Quote', 'An excerpted collection of words.'),
(81, NULL, 3, 'ReferenceSource', 'Reference Source', 'A document that presents authoritative reference information, such as a dictionary or encylopedia .'),
(82, NULL, 3, 'Report', 'Report', 'A document describing an account or statement describing in detail an event, situation, or the like, usually as the result of observation, inquiry, etc..'),
(83, NULL, 3, 'Series', 'Series', 'A loose, thematic, collection of Documents, often Books.'),
(84, NULL, 3, 'Slide', 'Slide', 'A slide in a slideshow'),
(85, NULL, 3, 'Slideshow', 'Slideshow', 'A presentation of a series of slides, usually presented in front of an audience with written text and images.'),
(86, NULL, 3, 'Standard', 'Standard', 'A document describing a standard'),
(87, NULL, 3, 'Statute', 'Statute', 'A bill enacted into law.'),
(88, NULL, 3, 'Thesis', 'Thesis', 'A document created to summarize research findings associated with the completion of an academic degree.'),
(89, NULL, 3, 'ThesisDegree', 'Thesis degree', 'The academic degree of a Thesis'),
(90, NULL, 3, 'Webpage', 'Webpage', 'A web page is an online document available (at least initially) on the world wide web. A web page is written first and foremost to appear on the web, as distinct from other online resources such as books, manuscripts or audio documents which use the web primarily as a distribution mechanism alongside other more traditional methods such as print.'),
(91, NULL, 3, 'Website', 'Website', 'A group of Webpages accessible on the Web.'),
(92, NULL, 3, 'Workshop', 'Workshop', 'A seminar, discussion group, or the like, that emphasizes zxchange of ideas and the demonstration and application of techniques, skills, etc.'),
(93, NULL, 4, 'LabelProperty', 'Label Property', 'A foaf:LabelProperty is any RDF property with texual values that serve as labels.'),
(94, NULL, 4, 'Person', 'Person', 'A person.'),
(95, NULL, 4, 'Document', 'Document', 'A document.'),
(96, NULL, 4, 'Organization', 'Organization', 'An organization.'),
(97, NULL, 4, 'Group', 'Group', 'A class of Agents.'),
(98, NULL, 4, 'Agent', 'Agent', 'An agent (eg. person, group, software or physical artifact).'),
(99, NULL, 4, 'Project', 'Project', 'A project (a collective endeavour of some kind).'),
(100, NULL, 4, 'Image', 'Image', 'An image.'),
(101, NULL, 4, 'PersonalProfileDocument', 'PersonalProfileDocument', 'A personal profile RDF document.'),
(102, NULL, 4, 'OnlineAccount', 'Online Account', 'An online account.'),
(103, NULL, 4, 'OnlineGamingAccount', 'Online Gaming Account', 'An online gaming account.'),
(104, NULL, 4, 'OnlineEcommerceAccount', 'Online E-commerce Account', 'An online e-commerce account.'),
(105, NULL, 4, 'OnlineChatAccount', 'Online Chat Account', 'An online chat account.'),
(110, 1, 6, 'User', 'User', NULL),
(111, 1, 6, 'MovieRecommanded', 'MovieRecommanded', NULL),
(112, 1, 6, 'MovieRating', 'MovieRating', NULL),
(113, 1, 6, 'Movie', 'Movie', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `resource_template`
--

CREATE TABLE `resource_template` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `title_property_id` int(11) DEFAULT NULL,
  `description_property_id` int(11) DEFAULT NULL,
  `label` varchar(190) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template`
--

INSERT INTO `resource_template` (`id`, `owner_id`, `resource_class_id`, `title_property_id`, `description_property_id`, `label`) VALUES
(1, NULL, NULL, NULL, NULL, 'Base Resource'),
(3, 1, NULL, NULL, NULL, 'CarTemplate'),
(7, 1, 113, NULL, NULL, 'MovieTemplate'),
(8, 1, 112, NULL, NULL, 'MovieRatingTemplate'),
(9, 1, 111, NULL, NULL, 'MovieRecommandedTemplate'),
(10, 1, 110, NULL, NULL, 'UserTemplate');

-- --------------------------------------------------------

--
-- Structure de la table `resource_template_property`
--

CREATE TABLE `resource_template_property` (
  `id` int(11) NOT NULL,
  `resource_template_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `alternate_label` varchar(255) DEFAULT NULL,
  `alternate_comment` longtext DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `data_type` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `is_required` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  `default_lang` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template_property`
--

INSERT INTO `resource_template_property` (`id`, `resource_template_id`, `property_id`, `alternate_label`, `alternate_comment`, `position`, `data_type`, `is_required`, `is_private`, `default_lang`) VALUES
(1, 1, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(2, 1, 15, NULL, NULL, 2, NULL, 0, 0, NULL),
(3, 1, 8, NULL, NULL, 3, NULL, 0, 0, NULL),
(4, 1, 2, NULL, NULL, 4, NULL, 0, 0, NULL),
(5, 1, 7, NULL, NULL, 5, NULL, 0, 0, NULL),
(6, 1, 4, NULL, NULL, 6, NULL, 0, 0, NULL),
(7, 1, 9, NULL, NULL, 7, NULL, 0, 0, NULL),
(8, 1, 12, NULL, NULL, 8, NULL, 0, 0, NULL),
(9, 1, 40, 'Place', NULL, 9, NULL, 0, 0, NULL),
(10, 1, 5, NULL, NULL, 10, NULL, 0, 0, NULL),
(11, 1, 17, NULL, NULL, 11, NULL, 0, 0, NULL),
(12, 1, 6, NULL, NULL, 12, NULL, 0, 0, NULL),
(13, 1, 25, NULL, NULL, 13, NULL, 0, 0, NULL),
(14, 1, 10, NULL, NULL, 14, NULL, 0, 0, NULL),
(15, 1, 13, NULL, NULL, 15, NULL, 0, 0, NULL),
(16, 1, 29, NULL, NULL, 16, NULL, 0, 0, NULL),
(17, 1, 30, NULL, NULL, 17, NULL, 0, 0, NULL),
(18, 1, 50, NULL, NULL, 18, NULL, 0, 0, NULL),
(19, 1, 3, NULL, NULL, 19, NULL, 0, 0, NULL),
(20, 1, 41, NULL, NULL, 20, NULL, 0, 0, NULL),
(24, 3, 4, NULL, NULL, 2, NULL, 0, 0, NULL),
(25, 3, 154, NULL, NULL, 3, NULL, 0, 0, NULL),
(27, 3, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(34, 8, 194, NULL, NULL, 2, NULL, 0, 0, NULL),
(35, 8, 192, NULL, NULL, 3, NULL, 0, 0, NULL),
(36, 8, 193, NULL, NULL, 4, NULL, 0, 0, NULL),
(37, 9, 192, NULL, NULL, 2, NULL, 0, 0, NULL),
(38, 9, 193, NULL, NULL, 3, NULL, 0, 0, NULL),
(39, 10, 190, NULL, NULL, 2, NULL, 0, 0, NULL),
(40, 10, 191, NULL, NULL, 3, NULL, 0, 0, NULL),
(41, 8, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(42, 9, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(43, 7, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(44, 10, 1, NULL, NULL, 1, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

CREATE TABLE `session` (
  `id` varchar(190) NOT NULL,
  `data` longblob NOT NULL,
  `modified` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `session`
--

INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('0lplafthf64cf76k2f91god082', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730303331323038322e393535393236383935313431363031353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22306c706c61667468663634636637366b32663931676f64303832223b7d7d, 1700312082),
('9q2dmjrlttr2cs56rvk36ea56e', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730313037373038372e343138343633393435333838373933393435333132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e37716c316c6e3061386d6262327230636f6238633332726569223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313038303233303b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313038303637343b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313730313038303536303b7d7d72656469726563745f75726c7c733a33353a22687474703a2f2f6c6f63616c686f73743a383038302f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223739643339386637373262303663373962616435643339633535663435383166223b733a33323a223531663839313337346264386132373038316630613836376639343633646261223b7d733a343a2268617368223b733a36353a2235316638393133373462643861323730383166306138363766393436336462612d3739643339386637373262303663373962616435643339633535663435383166223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a393a7b733a33323a223039373539326237396334616565663434393338623533643065313831333836223b733a33323a223134656239663664663932633038393633383364323439343764303233306462223b733a33323a223162343038313433656537663137393830303466366239373261663936326439223b733a33323a223434343935636137626237613335613130613039396164353134663263633065223b733a33323a223838663733363130623933666338373437323964633866643165306464303730223b733a33323a223437303861306166386366356163336564373962346461653364623032343435223b733a33323a226564326338376362373463393362313036326231626135386162396634643238223b733a33323a226261313637386330663932306139383433323039353634323061333235303063223b733a33323a223465383434363864303232646463393532333963626663383538636233386533223b733a33323a223436623536353939643764623731336338306334633031316536303638393534223b733a33323a226532343862626563633266353664643662353337366132386639393036636332223b733a33323a226138383162333339313833633530366536383233643238356365663663376661223b733a33323a223634366333373732383131663863316334356266393933636637303465656266223b733a33323a223032313436636238333233613632353030623634633732326663313230393939223b733a33323a226435393734383733636139306165336361333666356638323764656266303438223b733a33323a223466363831366439626530636435643164623332323263653965346561656432223b733a33323a226566383961626434333565646431323330303531643734356437623231356231223b733a33323a226364663761663239393161343235646232626564346536613630376664323036223b7d733a343a2268617368223b733a36353a2263646637616632393931613432356462326265643465366136303766643230362d6566383961626434333565646431323330303531643734356437623231356231223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223162343131383062373566333237303539616132326364373166343964386663223b733a33323a223639333836396236636361326661373935343763636239323061643637363830223b733a33323a226535623935323663643739663036656534666236323733643734396262323330223b733a33323a226563623661663038653563316265326331653736633165353735343636663861223b733a33323a223162373333313339313865303934323330323163616137346462376163653532223b733a33323a226635613037373363303064356234396563646262343837326364326339376263223b733a33323a223433646434313636663034383962366339613265373532666134323536653063223b733a33323a226130646431623064646638393862616538626262646339336137336533343662223b7d733a343a2268617368223b733a36353a2261306464316230646466383938626165386262626463393361373365333436622d3433646434313636663034383962366339613265373532666134323536653063223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1701077087),
('cr8vge4m62lr07hjjcdrsavs8p', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730303437303936352e3836383133343937353433333334393630393337353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226766396c6a396c736776686d693461346367636e743573666c65223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730303437333338353b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730303437343535393b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313730303437343536353b7d7d72656469726563745f75726c7c733a33353a22687474703a2f2f6c6f63616c686f73743a383038302f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223261333461343965343636626265666635353033613232656638623236613031223b733a33323a223937336139343436366134643061623066396461626662343534626431393431223b7d733a343a2268617368223b733a36353a2239373361393434363661346430616230663964616266623435346264313934312d3261333461343965343636626265666635353033613232656638623236613031223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223834653062666262383239323561633564383237623031373866636433376339223b733a33323a226233393661386464323666343863353336663531393837373033396165366266223b733a33323a226131643363353639663636656432356235383266643932666134623633613361223b733a33323a223234356266376436316435643566626335333930356435363136363236633466223b7d733a343a2268617368223b733a36353a2232343562663764363164356435666263353339303564353631363632366334662d6131643363353639663636656432356235383266643932666134623633613361223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223930613264343361303034353039376564383135396537326436666534343137223b733a33323a226162656234376538653366323537326631336666343335326438636563393838223b7d733a343a2268617368223b733a36353a2261626562343765386533663235373266313366663433353264386365633938382d3930613264343361303034353039376564383135396537326436666534343137223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1700470965),
('eu7l0ehks62e15npgren6t7jrr', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730303433333337352e30343936353439363036333233323432313837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227530397069683863757574636b6b7266616d6b6e616975317437223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730303433363636323b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730303433363731323b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730303433363731323b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730303433363931393b7d7d72656469726563745f75726c7c733a33353a22687474703a2f2f3132372e302e302e313a383038302f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223961306431663839636331333565336430663761616233363564373866643339223b733a33323a226436343430663463396235366261313165363734333338316662663162613862223b733a33323a226262626465663235633530336333303838666331303061653937663731386232223b733a33323a226365376331613163363333626364306230333839613464623636303362616264223b7d733a343a2268617368223b733a36353a2263653763316131633633336263643062303338396134646236363033626162642d6262626465663235633530336333303838666331303061653937663731386232223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a353a7b733a33323a223638643134303531613565346135663164333639663437373366346139356166223b733a33323a223231643665363361323666346263383863346161333238656665393938356638223b733a33323a223234313063313532393734613538613332323464383236366532333230633766223b733a33323a223664313864613565656133666631316530353865393631323765353238386164223b733a33323a226463303061653864396663623339326664323836383132613235656238666164223b733a33323a223361363365373266353863323137323432646261323539613362663432393438223b733a33323a226332333939633731393030376533353432653838386530656130626639633065223b733a33323a226639323761303435613330613432306266656236336562356434643661333330223b733a33323a223963626164363134376335396430663430636564346438613931383661363966223b733a33323a223934376130383064653462643532656531656534633263613836343533643164223b7d733a343a2268617368223b733a36353a2239343761303830646534626435326565316565346332636138363435336431642d3963626164363134376335396430663430636564346438613931383661363966223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223661343732303534616138353232643262393266636466353561316165333931223b733a33323a223066656330383437356566313434346334333132316364313838396463366238223b7d733a343a2268617368223b733a36353a2230666563303834373565663134343463343331323163643138383964633662382d3661343732303534616138353232643262393266636466353561316165333931223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223763393136633137383733646263633665653238643930393231353234616635223b733a33323a223835306666376234313135326334633666393165326663393866393138626335223b733a33323a226331313535376565383834346430663039663666393564613433616633666631223b733a33323a226331366539623232393835303062346135366234333465636165613162326337223b733a33323a223464383230313262656661666462613265303666656338636264383861393963223b733a33323a223566323636343164323064653235356666333864306534343761383765396237223b7d733a343a2268617368223b733a36353a2235663236363431643230646532353566663338643065343437613837653962372d3464383230313262656661666462613265303666656338636264383861393963223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1700433375),
('fd0j572eerc48i0avlqhj1pp5j', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313639393837303030322e32323930363230383033383333303037383132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22336b3264656334306b3269707571343864397033667662367562223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639393836393536353b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639393837323537383b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313639393837323539313b7d7d72656469726563745f75726c7c733a33353a22687474703a2f2f6c6f63616c686f73743a383038302f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223739363963643164643936643231383164316161353738383131323635353237223b733a33323a226232313039373934393034333030326131326438353536656435323264363336223b733a33323a223464656263386432646264663365343434306665326562333936613931613336223b733a33323a226561316163626331306436383934663061613232333739366531306663363537223b7d733a343a2268617368223b733a36353a2265613161636263313064363839346630616132323337393665313066633635372d3464656263386432646264663365343434306665326562333936613931613336223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226362303661366264353561353161343236373262623965633762613935653435223b733a33323a226262323565353563393565333761633131336635323065626661653333636236223b733a33323a226438343334666235626264346439323831653061373766323664373063326335223b733a33323a223634653861653335393361313632633735373730313639393437656461623266223b7d733a343a2268617368223b733a36353a2236346538616533353933613136326337353737303136393934376564616232662d6438343334666235626264346439323831653061373766323664373063326335223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226231373137333034623034396631613066623539343234336638623437353938223b733a33323a223737343532343033363438303965326637343766626663616235666533383262223b733a33323a223966363634383232643934626539663733633161353066353431656262646530223b733a33323a223461356334383337306462333233363538366535666635616433343764613439223b7d733a343a2268617368223b733a36353a2234613563343833373064623332333635383665356666356164333437646134392d3966363634383232643934626539663733633161353066353431656262646530223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1699870002),
('hdo9ipvntocrg4cve3dsvaatof', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313639393837303035322e3837343038343934393439333430383230333132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2268646f396970766e746f63726734637665336473766161746f66223b7d7d, 1699870052),
('j3d3cq3jm03r038bnkf14ad0g8', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730313037373231372e3134363735303932363937313433353534363837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22366739376c336f326d6f706e6d626d756e383269347163703072223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313038303731333b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313038303831343b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313730313038303830303b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226465653039346338623263386462363331346330626330336563353036313838223b733a33323a223839386335343632323332343938643364363961333065623139343639633663223b733a33323a223638303535363463346634316237643838323062613762376238666162613030223b733a33323a226231623161373636306337653239363436333061623465363566663132333533223b7d733a343a2268617368223b733a36353a2262316231613736363063376532393634363330616234653635666631323335332d3638303535363463346634316237643838323062613762376238666162613030223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223661343761653562343366666530383334656535323365613538633966613230223b733a33323a223664326337363033616266656437666532336430316639393335373734393939223b733a33323a223364353230326665363139316135363439656662376339613063383666616563223b733a33323a226332613064343437356163633838376461323462376131646361373065636562223b733a33323a223662633366343337636237643338346538323763316266353664373430306438223b733a33323a223633393833356233623331346530656639303739373263623138396430373766223b733a33323a223838303335306166636563363166616164346362343038316139366131653663223b733a33323a226264313833356633623837306362393262336465663065316434346465646634223b7d733a343a2268617368223b733a36353a2262643138333566336238373063623932623364656630653164343464656466342d3838303335306166636563363166616164346362343038316139366131653663223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226661613466303462646563613632653564613539373338313430633464653932223b733a33323a223265633237313230313832616364623362616436366465383730663239393233223b733a33323a223564373666653635663937613863376239336464666337663534623161646137223b733a33323a223162323739383135666263323430356534376663663036333136316231653561223b7d733a343a2268617368223b733a36353a2231623237393831356662633234303565343766636630363331363162316535612d3564373666653635663937613863376239336464666337663534623161646137223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1701077217),
('k3ta4pbu388s2g69m2kgi2ho3e', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730303331343033382e373732333536303333333235313935333132353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22343368716a673065346c38393569756566336e6b373734396474223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730303331323137343b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730303331373633383b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313730303331323238313b7d7d72656469726563745f75726c7c733a33353a22687474703a2f2f6c6f63616c686f73743a383038302f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226539323633326332313231633033613139313437396166323736363331393064223b733a33323a223337303735363730303033356362343537326635343938316231646537366635223b7d733a343a2268617368223b733a36353a2233373037353637303030333563623435373266353439383162316465373666352d6539323633326332313231633033613139313437396166323736363331393064223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a34383a7b733a33323a223264616166363261393264306637626334373037633831643563376534623838223b733a33323a223966383338353865373434323537386532666334343938393039323836343532223b733a33323a226563616533353463373062623434323435346338393935656238666339363936223b733a33323a226162626563326565646633653839363366303733303661656138326533366330223b733a33323a223862663065306461626566343637323937333830666666363962333639326533223b733a33323a223962346639303037623664383930393138663866666465383531643335636261223b733a33323a226531326464643036313464653430663764373037323138663337633131343064223b733a33323a226138663332633230336137373730373735393838336433326138306237316162223b733a33323a223665663365623533663835306436303730643033633066343262363631656136223b733a33323a226431346530326432363266323463653161666631653130306334613465373536223b733a33323a223361643536316431646561663433366663623966303663666531316230326235223b733a33323a223633353739616263366136366431303634353233643936616434366637373662223b733a33323a223839626337363133643435376630626131666433353639383465613437343931223b733a33323a223863653033313732613965383533353137636261626330333438366139633564223b733a33323a223439343532303731656665623836663632393564356165633565663333396461223b733a33323a223733376264313062663530636133613534373636353866383032393662343564223b733a33323a223165386439623836353931326264653865323264323830393032666330306531223b733a33323a226163346561356636663431623038663439646561326231376264646137383464223b733a33323a223166626433356432343261653732346264383830666661646439383533393030223b733a33323a223239623066626633393962383333356438613132666132636235356432633130223b733a33323a223361613764636462643734376632646262363661613834306631623163376232223b733a33323a223133313931643461356265306134396437363636373037643935666532373332223b733a33323a223338313338326364383566323063656431346537663738313761346162643634223b733a33323a223832306536343332383635643038623965363565326263633361306439633638223b733a33323a223738656365663835316362336135343838343639386336386230366534323831223b733a33323a223733376662636538636366323036383664656337383334396661306537356637223b733a33323a226261383364653632373235313162343336313737303535333537393236396531223b733a33323a223633396532653366336132393665393133643235633466313638663466653462223b733a33323a223236643238666539376564643131613137393731363961626333383765643334223b733a33323a223665343431333331353339636332636537346338366232613131346338323631223b733a33323a223832613366336234376334636334323036346561316565376332336564396362223b733a33323a226339386530366663356431363936373838613663636563656133393633383663223b733a33323a226362336131346562653465356361353934663264343030363965366363343938223b733a33323a226131653931663262626632373866343733313032613637666461306339646465223b733a33323a223239313436356638333631643666656662313036393062386161346536396463223b733a33323a226433633761633132653637376635383232323932386234656264303632626234223b733a33323a226436656535393034643834376238306562363330643464656331316237663165223b733a33323a223134636665336239383562623262643965643733316564613935393766643565223b733a33323a223361346362626634626232363338323435393966643934656438653131636166223b733a33323a223263333561353334393737343635396661383535613361636665653764393130223b733a33323a223131653730343636656634356334353438653131643163383330623236653434223b733a33323a223435396439633361623762383230323039386561333433333935363134333163223b733a33323a223432626265653231613062396532663638643962316461636533343563386636223b733a33323a223132373735326666653765636630613131336465663663386362376434613664223b733a33323a226336363939383538313636376333613635613765646666306164336236633435223b733a33323a226531343131333066366262616537383630313364383332333630353763326337223b733a33323a223733643632623237383661333831363664383237353731643462323966633062223b733a33323a223031633737633432613463323865613830336335306361306137613831303134223b733a33323a223466366463363534663834356663626134306364383238383037316563323330223b733a33323a223632393839396564373962336335313633333431623663363935343666633533223b733a33323a223531613430616330316334353162363735393439626262316364663162336166223b733a33323a226130666564376564356630643964666233663164613939363334363034303636223b733a33323a226438323935646166303664633635326230613236303162333835343935396562223b733a33323a223463336239653561393631626536316237346236633135316137636664383139223b733a33323a223238343766383165343364376162663961636639373238643435363064306162223b733a33323a223637633761396534313562326636363630396464376231646235383365663333223b733a33323a223739363736356562303535343361303664616538373730616138353935336363223b733a33323a223833633464333837663261653836316432376334623566363333623733616435223b733a33323a223635663534393965333262323862313937633939316166393836313935373166223b733a33323a223330633137326162383630326537306630363966656636653165663735393537223b733a33323a223736666636643137306535393134343139383863303238633137383537323834223b733a33323a226331353634633937383832623863636234363637333365346631366335663262223b733a33323a223139623935303434613438363531623630666437623165616265363230346537223b733a33323a226235643438643663343764363336383262666566303961333462303531636436223b733a33323a223161336535616366323661616662303762393363386138393035313238636536223b733a33323a223530663362383835383465336233663135303661313831383639633162646630223b733a33323a223634386466356130343836656331396139396662636130323332623533633066223b733a33323a226635383436613736386335663230373465383236626461303035613733353964223b733a33323a226635643033316538636135343834343833633864366234393030343863396430223b733a33323a226362643633636538663361306562643937616330396366376138353737656233223b733a33323a223939663535376539653533626238373031633462353933663864626633323862223b733a33323a223965363033383231386234646331623831643166363631313266666138623735223b733a33323a223038393065336662336637363763396333653066656530343634613339383435223b733a33323a226639346239663932356432656639613463653066353833646232383562656231223b733a33323a223133313836323433653564633837346238656432313562323835343063623964223b733a33323a223838653566366337623437666130363564393038396338303564376636386464223b733a33323a223061663234656466646539363639663334353831363936323464663163653665223b733a33323a223433326536656266333865656336343230306261346539356231666333356334223b733a33323a226632613638623063316163383931633232613537613032313431623531366230223b733a33323a223134623033343465653563656237616338623464326430613264656639373566223b733a33323a223530613061363938326462643036633238386330306638396330336536366336223b733a33323a223762643539393665333534393661353434646464653034643533313638623566223b733a33323a223236383739666136366137353232623133353033636539333665633232393336223b733a33323a223735363030653334343634343761623531336264306132353834376633666236223b733a33323a223730343266623335363739653935363364313362346339333532333430333464223b733a33323a226539656531313939666361373837373565303937653231353439366366386363223b733a33323a226363346561366666343839333039393366336639323161396237626333313335223b733a33323a226436333162323564623230623431393461383038326131333364303634393963223b733a33323a226433643435643563396265343161343230643766333435376532333931343663223b733a33323a223636613239643966333165356538393138613430396464353165633137616133223b733a33323a226366646161313633373663613764646239383264653062646432623034633138223b733a33323a223331353030333237313037373861356663636533383137373164383839316130223b733a33323a226238353734353939336233343532303962386532306134343232386133636161223b733a33323a226666353866363863393464613265636161643361623538663333616134386566223b733a33323a223666366166636462313931363066343739323433333462343138383834356261223b733a33323a223737626565646638376639656438623339346233616531366462666533383035223b7d733a343a2268617368223b733a36353a2237376265656466383766396564386233393462336165313664626665333830352d3666366166636462313931363066343739323433333462343138383834356261223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31333a7b733a33323a223139336237353533323963333565646463386539386565646537353963383931223b733a33323a223838663233343462326333393162303334333636303032343061653665623631223b733a33323a223935313138396436326332396535656238356566393530363636386430303532223b733a33323a226662323836663133373934303962333333343465386233356538386164363962223b733a33323a226163343462323061353731623934353733303064613832343839623961623034223b733a33323a223434366537396136623335653739356436643933633937613932383336636438223b733a33323a226338366662356133356430353562336431363632643434666665313338343337223b733a33323a223834323165626638373134346533616565336263343763613834633063623164223b733a33323a223963363965643439373765663361353837376466373461363036613662366337223b733a33323a226364633832313333636135656238356565383531613462613739333933336363223b733a33323a223638616538346461396465616466396530653361326363666339336539336636223b733a33323a223639323736326130623839666533653763333731336238363830333863656532223b733a33323a223062393833343739313237613230383536666431363039653137636236333165223b733a33323a223732383564363362336566633835643364633163386339636136363835333165223b733a33323a223932653264313238633731373666653165313439396437353062326434383362223b733a33323a223139313863313861396636626562393962353135343536633065643838633164223b733a33323a223633653362313265346561396136376631343638366530383235333530326665223b733a33323a226231373561613533626332666365303238356135656564613337633733613430223b733a33323a226136663338333462373031333637383835626530636463323261323032336163223b733a33323a226266643834303761616362623438613930373662313731656535383065343936223b733a33323a223030303465386166643137303636373839643730356339366366366237666262223b733a33323a226465633065623162653636656537363731616162623665333363633934303263223b733a33323a223863386534343335363761333239353033346539353935346235333931633239223b733a33323a223839643465336161363437323366353065663036366230663565313332363861223b733a33323a223764323461393835353863666366616435663166303365353932613637333530223b733a33323a223766333462316230343764623861613936336630626562613233623434653061223b7d733a343a2268617368223b733a36353a2237663334623162303437646238616139363366306265626132336234346530612d3764323461393835353863666366616435663166303365353932613637333530223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1700314038),
('ljqejuojmnhovm4uo3d6pp9o0v', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313639393836393935372e373735333435303837303531333931363031353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c6a71656a756f6a6d6e686f766d34756f3364367070396f3076223b7d7d, 1699869957);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('qn7873o7p94vipks1lrua1lr25', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730313037373732382e32323931303430343230353332323236353632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2270686e757270336667343270637231327563656767746b6e6a65223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313038303834393b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313038303931343b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313730313038303932313b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223031303562656464386234343933393336333762353932623532316339383965223b733a33323a223737366264363263336463376235366264633066636639343231383166626432223b733a33323a223330386436373234353765386633393561666332623665643839386135306339223b733a33323a223663363331346166626134666436643831373336666433363261353230303432223b733a33323a226137366462303965376539656139386365623933616266356366636336313237223b733a33323a226231303264353236636532626233656166396237373863323231353630643937223b7d733a343a2268617368223b733a36353a2262313032643532366365326262336561663962373738633232313536306439372d6137366462303965376539656139386365623933616266356366636336313237223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a323b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223330643965373139613739373838623732363964353733613032656664613139223b733a33323a223135316566313565613366343461356164323361633262623437626563333265223b733a33323a223461616133616433643638353561663765623735343936656634333466616336223b733a33323a223030633731383033383634383638326363633265366364613763336436653534223b7d733a343a2268617368223b733a36353a2230306337313830333836343836383263636332653663646137633364366535342d3461616133616433643638353561663765623735343936656634333466616336223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226130666664656334616330656261633163386238633833306231643230366531223b733a33323a223438353163643436636435313066623763313666376262646530333336323232223b7d733a343a2268617368223b733a36353a2234383531636434366364353130666237633136663762626465303333363232322d6130666664656334616330656261633163386238633833306231643230366531223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1701077728),
('rg434ujuagsta9rk2hmdsa62ql', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313639393837303032362e35313530363830353431393932313837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227267343334756a75616773746139726b32686d6473613632716c223b7d7d, 1699870026),
('sdj5s74a37d1hc7bu2jv1bctif', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313639393837303032322e393637383930303234313835313830363634303632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2273646a3573373461333764316863376275326a76316263746966223b7d7d, 1699870022),
('ubs4fm2sui63nupooqtqllb95a', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313639393836393934382e373139333639383838333035363634303632353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2275627334666d3273756936336e75706f6f7174716c6c62393561223b7d7d, 1699869948);

-- --------------------------------------------------------

--
-- Structure de la table `setting`
--

CREATE TABLE `setting` (
  `id` varchar(190) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `setting`
--

INSERT INTO `setting` (`id`, `value`) VALUES
('administrator_email', '\"benaissas886@gmail.com\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('installation_title', '\"Thyp\"'),
('locale', '\"\"'),
('media_type_whitelist', '[\"application\\/msword\",\"application\\/ogg\",\"application\\/pdf\",\"application\\/rtf\",\"application\\/vnd.ms-access\",\"application\\/vnd.ms-excel\",\"application\\/vnd.ms-powerpoint\",\"application\\/vnd.ms-project\",\"application\\/vnd.ms-write\",\"application\\/vnd.oasis.opendocument.chart\",\"application\\/vnd.oasis.opendocument.database\",\"application\\/vnd.oasis.opendocument.formula\",\"application\\/vnd.oasis.opendocument.graphics\",\"application\\/vnd.oasis.opendocument.presentation\",\"application\\/vnd.oasis.opendocument.spreadsheet\",\"application\\/vnd.oasis.opendocument.text\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"application\\/x-gzip\",\"application\\/x-ms-wmp\",\"application\\/x-msdownload\",\"application\\/x-shockwave-flash\",\"application\\/x-tar\",\"application\\/zip\",\"audio\\/midi\",\"audio\\/mp4\",\"audio\\/mpeg\",\"audio\\/ogg\",\"audio\\/x-aac\",\"audio\\/x-aiff\",\"audio\\/x-ms-wma\",\"audio\\/x-ms-wax\",\"audio\\/x-realaudio\",\"audio\\/x-wav\",\"image\\/bmp\",\"image\\/gif\",\"image\\/jp2\",\"image\\/jpeg\",\"image\\/pjpeg\",\"image\\/png\",\"image\\/tiff\",\"image\\/x-icon\",\"text\\/css\",\"text\\/plain\",\"text\\/richtext\",\"video\\/divx\",\"video\\/mp4\",\"video\\/mpeg\",\"video\\/ogg\",\"video\\/quicktime\",\"video\\/webm\",\"video\\/x-ms-asf,\",\"video\\/x-msvideo\",\"video\\/x-ms-wmv\"]'),
('pagination_per_page', '25'),
('time_zone', '\"Europe\\/Paris\"'),
('use_htmlpurifier', '\"1\"'),
('version', '\"4.0.4\"'),
('version_notifications', '\"1\"');

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

CREATE TABLE `site` (
  `id` int(11) NOT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `homepage_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `slug` varchar(190) NOT NULL,
  `theme` varchar(190) NOT NULL,
  `title` varchar(190) NOT NULL,
  `summary` longtext DEFAULT NULL,
  `navigation` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `item_pool` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `assign_new_items` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_block_attachment`
--

CREATE TABLE `site_block_attachment` (
  `id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `caption` longtext NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_item_set`
--

CREATE TABLE `site_item_set` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_page`
--

CREATE TABLE `site_page` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `slug` varchar(190) NOT NULL,
  `title` varchar(190) NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_page_block`
--

CREATE TABLE `site_page_block` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `layout` varchar(80) NOT NULL,
  `data` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_permission`
--

CREATE TABLE `site_permission` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_setting`
--

CREATE TABLE `site_setting` (
  `id` varchar(190) NOT NULL,
  `site_id` int(11) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(190) NOT NULL,
  `name` varchar(190) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `password_hash` varchar(60) DEFAULT NULL,
  `role` varchar(190) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `created`, `modified`, `password_hash`, `role`, `is_active`) VALUES
(1, 'benaissas886@gmail.com', 'sidahmed benaissa', '2023-10-16 14:30:49', '2023-10-16 14:30:49', '$2y$10$gjvWRethKSBelt9ywB9JE.UDFLSrLZ83SkMlHLdxfAc.LRomDMqKm', 'global_admin', 1),
(2, 'samuel.szoniecky@univ-paris8.fr', 'samuel', '2023-11-27 09:21:46', '2023-11-27 09:26:40', '$2y$10$IMS7uEyqwzXZoEqzH01ilOl17z33rZEYdcKrNJQ7y7.pvd7iZ.49a', 'global_admin', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user_setting`
--

CREATE TABLE `user_setting` (
  `id` varchar(190) NOT NULL,
  `user_id` int(11) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_setting`
--

INSERT INTO `user_setting` (`id`, `user_id`, `value`) VALUES
('browse_defaults_admin_item_sets', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_item_sets', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_items', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_items', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_media', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_media', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_sites', 1, '{\"sort_by\":\"title\",\"sort_order\":\"asc\"}'),
('browse_defaults_admin_sites', 2, '{\"sort_by\":\"title\",\"sort_order\":\"asc\"}'),
('columns_admin_item_sets', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_item_sets', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_items', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_items', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_media', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_media', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_sites', 1, '[{\"type\":\"slug\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_sites', 2, '[{\"type\":\"slug\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('default_resource_template', 1, '\"\"'),
('default_resource_template', 2, '\"\"'),
('locale', 1, '\"\"'),
('locale', 2, '\"\"');

-- --------------------------------------------------------

--
-- Structure de la table `value`
--

CREATE TABLE `value` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `value_resource_id` int(11) DEFAULT NULL,
  `value_annotation_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `lang` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `uri` longtext DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `value`
--

INSERT INTO `value` (`id`, `resource_id`, `property_id`, `value_resource_id`, `value_annotation_id`, `type`, `lang`, `value`, `uri`, `is_public`) VALUES
(9, 4, 1, NULL, NULL, 'literal', '', 'Tesla Model S', NULL, 1),
(10, 4, 4, NULL, NULL, 'literal', '', 'La Tesla Model S est une berline électrique produite par Tesla, Inc. Elle est reconnue pour ses performances exceptionnelles, son autonomie élevée et son design élégant.', NULL, 1),
(11, 4, 154, NULL, NULL, 'literal', '', 'https://photos.auto-moto.com/32/2023/09/photo_article/23999/120990/1200-L-tesla-model-s-et-model-x-grosse-baisse-de-prix-pour-la-berline-et-le-suv-lectriques.webp', NULL, 1),
(12, 5, 1, NULL, NULL, 'literal', '', 'Audi Q5', NULL, 1),
(13, 5, 4, NULL, NULL, 'literal', '', ' L\'Audi Q5 est un SUV compact offrant un mélange équilibré de luxe, de performances et de polyvalence', NULL, 1),
(14, 5, 154, NULL, NULL, 'literal', '', 'https://images.caradisiac.com/images/6/4/9/0/196490/S1-essai-audi-q5-sportback-40-tdi-2022-716971.jpg', NULL, 1),
(15, 6, 1, NULL, NULL, 'literal', '', 'Ford Mustang GT', NULL, 1),
(16, 6, 4, NULL, NULL, 'literal', '', 'La Ford Mustang GT est une voiture de sport emblématique et puissante, avec un style rétro associé à des performances modernes', NULL, 1),
(17, 6, 154, NULL, NULL, 'literal', '', 'https://i.ytimg.com/vi/PH0xGmz_D5Q/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLBznkNk6v4nvWXErzMN7bSLRFiRIw', NULL, 1),
(18, 7, 1, NULL, NULL, 'literal', '', 'Sidahmed', NULL, 1),
(19, 7, 190, NULL, NULL, 'literal', '', 'Sidahmed', NULL, 1),
(20, 8, 1, NULL, NULL, 'literal', '', 'Lorenzo', NULL, 1),
(21, 8, 190, NULL, NULL, 'literal', '', 'Lorenzo', NULL, 1),
(22, 9, 1, NULL, NULL, 'literal', '', 'Fast And Furious 8', NULL, 1),
(23, 10, 1, NULL, NULL, 'literal', '', 'Maman j\'ai raté l\'avion', NULL, 1),
(24, 8, 191, NULL, NULL, 'literal', '', 'lorenzo@gmail.com', NULL, 1),
(25, 7, 191, NULL, NULL, 'literal', '', 'sidahmed@gmail.com', NULL, 1),
(26, 11, 1, NULL, NULL, 'literal', '', 'Note sidahmed', NULL, 1),
(27, 11, 194, NULL, NULL, 'literal', '', '10', NULL, 1),
(28, 11, 192, 7, NULL, 'resource', NULL, NULL, NULL, 1),
(29, 11, 193, 9, NULL, 'resource', NULL, NULL, NULL, 1),
(30, 12, 1, NULL, NULL, 'literal', '', 'Note Lorenzo', NULL, 1),
(31, 12, 194, NULL, NULL, 'literal', '', '7', NULL, 1),
(32, 12, 192, 8, NULL, 'resource', NULL, NULL, NULL, 1),
(33, 12, 193, 10, NULL, 'resource', NULL, NULL, NULL, 1),
(34, 13, 1, NULL, NULL, 'literal', '', 'Recommandation sidahmed', NULL, 1),
(35, 13, 192, 7, NULL, 'resource', NULL, NULL, NULL, 1),
(36, 13, 193, 10, NULL, 'resource', NULL, NULL, NULL, 1),
(37, 14, 1, NULL, NULL, 'literal', '', 'Recommandation Lorenzo', NULL, 1),
(38, 14, 192, 8, NULL, 'resource', NULL, NULL, NULL, 1),
(39, 14, 193, 9, NULL, 'resource', NULL, NULL, NULL, 1),
(170, 25, 1, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(171, 25, 15, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(172, 25, 8, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(173, 25, 2, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(174, 25, 7, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(175, 25, 4, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(176, 25, 9, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(177, 25, 12, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(178, 25, 40, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(179, 25, 5, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(180, 25, 17, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(181, 25, 6, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(182, 25, 25, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(183, 25, 10, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(184, 25, 13, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(185, 25, 29, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(186, 25, 30, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(187, 25, 50, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(188, 25, 3, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(189, 25, 41, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(190, 26, 1, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(191, 26, 15, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(192, 26, 8, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(193, 26, 2, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(194, 26, 7, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(195, 26, 4, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(196, 26, 9, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(197, 26, 12, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(198, 26, 40, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(199, 26, 5, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(200, 26, 17, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(201, 26, 6, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(202, 26, 25, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(203, 26, 10, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(204, 26, 13, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(205, 26, 29, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(206, 26, 30, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(207, 26, 50, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(208, 26, 3, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(209, 26, 41, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(210, 27, 1, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(211, 27, 15, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(212, 27, 8, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(213, 27, 2, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(214, 27, 7, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(215, 27, 4, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(216, 27, 9, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(217, 27, 12, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(218, 27, 40, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(219, 27, 5, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(220, 27, 17, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(221, 27, 6, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(222, 27, 25, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(223, 27, 10, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(224, 27, 13, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(225, 27, 29, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(226, 27, 30, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(227, 27, 50, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(228, 27, 3, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(229, 27, 41, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(230, 28, 1, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(231, 28, 15, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(232, 28, 8, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(233, 28, 2, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(234, 28, 7, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(235, 28, 4, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(236, 28, 9, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(237, 28, 12, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(238, 28, 40, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(239, 28, 5, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(240, 28, 17, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(241, 28, 6, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(242, 28, 25, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(243, 28, 10, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(244, 28, 13, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(245, 28, 29, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(246, 28, 30, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(247, 28, 50, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(248, 28, 3, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(249, 28, 41, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(250, 29, 1, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(251, 29, 15, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(252, 29, 8, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(253, 29, 2, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(254, 29, 7, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(255, 29, 4, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(256, 29, 9, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(257, 29, 12, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(258, 29, 40, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(259, 29, 5, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(260, 29, 17, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(261, 29, 6, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(262, 29, 25, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(263, 29, 10, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(264, 29, 13, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(265, 29, 29, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(266, 29, 30, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(267, 29, 50, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(268, 29, 3, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(269, 29, 41, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(270, 30, 1, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(271, 30, 4, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(272, 30, 154, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(273, 31, 1, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(274, 31, 15, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(275, 31, 8, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(276, 31, 2, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(277, 31, 7, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(278, 31, 4, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(279, 31, 9, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(280, 31, 12, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(281, 31, 40, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(282, 31, 5, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(283, 31, 17, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(284, 31, 6, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(285, 31, 25, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(286, 31, 10, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(287, 31, 13, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(288, 31, 29, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(289, 31, 30, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(290, 31, 50, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(291, 31, 3, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(292, 31, 41, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(293, 32, 1, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(294, 32, 4, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(295, 32, 154, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(296, 33, 1, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(297, 33, 15, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(298, 33, 8, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(299, 33, 2, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(300, 33, 7, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(301, 33, 4, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(302, 33, 9, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(303, 33, 12, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(304, 33, 40, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(305, 33, 5, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(306, 33, 17, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(307, 33, 6, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(308, 33, 25, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(309, 33, 10, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(310, 33, 13, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(311, 33, 29, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(312, 33, 30, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(313, 33, 50, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(314, 33, 3, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(315, 33, 41, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(316, 34, 1, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(317, 34, 15, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(318, 34, 8, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(319, 34, 2, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(320, 34, 7, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(321, 34, 4, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(322, 34, 9, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(323, 34, 12, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(324, 34, 40, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(325, 34, 5, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(326, 34, 17, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(327, 34, 6, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(328, 34, 25, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(329, 34, 10, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(330, 34, 13, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(331, 34, 29, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(332, 34, 30, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(333, 34, 50, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(334, 34, 3, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1),
(335, 34, 41, NULL, NULL, 'literal', NULL, 'blabla', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `value_annotation`
--

CREATE TABLE `value_annotation` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vocabulary`
--

CREATE TABLE `vocabulary` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `namespace_uri` varchar(190) NOT NULL,
  `prefix` varchar(190) NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vocabulary`
--

INSERT INTO `vocabulary` (`id`, `owner_id`, `namespace_uri`, `prefix`, `label`, `comment`) VALUES
(1, NULL, 'http://purl.org/dc/terms/', 'dcterms', 'Dublin Core', 'Basic resource metadata (DCMI Metadata Terms)'),
(2, NULL, 'http://purl.org/dc/dcmitype/', 'dctype', 'Dublin Core Type', 'Basic resource types (DCMI Type Vocabulary)'),
(3, NULL, 'http://purl.org/ontology/bibo/', 'bibo', 'Bibliographic Ontology', 'Bibliographic metadata (BIBO)'),
(4, NULL, 'http://xmlns.com/foaf/0.1/', 'foaf', 'Friend of a Friend', 'Relationships between people and organizations (FOAF)'),
(6, 1, 'https://movie-recommandation/onto/mr', 'mr', 'MovieRecommandation', '');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `api_key`
--
ALTER TABLE `api_key`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C912ED9D7E3C61F9` (`owner_id`);

--
-- Index pour la table `asset`
--
ALTER TABLE `asset`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2AF5A5C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_2AF5A5C7E3C61F9` (`owner_id`);

--
-- Index pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD PRIMARY KEY (`id`,`resource`),
  ADD KEY `IDX_AA31FE4A7E3C61F9` (`owner_id`);
ALTER TABLE `fulltext_search` ADD FULLTEXT KEY `IDX_AA31FE4A2B36786B3B8BA7C7` (`title`,`text`);

--
-- Index pour la table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1F1B251ECBE0B084` (`primary_media_id`);

--
-- Index pour la table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD PRIMARY KEY (`item_id`,`item_set_id`),
  ADD KEY `IDX_6D0C9625126F525E` (`item_id`),
  ADD KEY `IDX_6D0C9625960278D7` (`item_set_id`);

--
-- Index pour la table `item_set`
--
ALTER TABLE `item_set`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `item_site`
--
ALTER TABLE `item_site`
  ADD PRIMARY KEY (`item_id`,`site_id`),
  ADD KEY `IDX_A1734D1F126F525E` (`item_id`),
  ADD KEY `IDX_A1734D1FF6BD1646` (`site_id`);

--
-- Index pour la table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FBD8E0F87E3C61F9` (`owner_id`);

--
-- Index pour la table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_6A2CA10C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_6A2CA10C126F525E` (`item_id`),
  ADD KEY `item_position` (`item_id`,`position`);

--
-- Index pour la table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_creation`
--
ALTER TABLE `password_creation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C77917B4A76ED395` (`user_id`);

--
-- Index pour la table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8BF21CDEAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_8BF21CDE7E3C61F9` (`owner_id`),
  ADD KEY `IDX_8BF21CDEAD0E05F6` (`vocabulary_id`);

--
-- Index pour la table `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BC91F4167E3C61F9` (`owner_id`),
  ADD KEY `IDX_BC91F416448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_BC91F41616131EA` (`resource_template_id`),
  ADD KEY `IDX_BC91F416FDFF2E92` (`thumbnail_id`),
  ADD KEY `title` (`title`(190));

--
-- Index pour la table `resource_class`
--
ALTER TABLE `resource_class`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C6F063ADAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_C6F063AD7E3C61F9` (`owner_id`),
  ADD KEY `IDX_C6F063ADAD0E05F6` (`vocabulary_id`);

--
-- Index pour la table `resource_template`
--
ALTER TABLE `resource_template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_39ECD52EEA750E8` (`label`),
  ADD KEY `IDX_39ECD52E7E3C61F9` (`owner_id`),
  ADD KEY `IDX_39ECD52E448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_39ECD52E724734A3` (`title_property_id`),
  ADD KEY `IDX_39ECD52EB84E0D1D` (`description_property_id`);

--
-- Index pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_4689E2F116131EA549213EC` (`resource_template_id`,`property_id`),
  ADD KEY `IDX_4689E2F116131EA` (`resource_template_id`),
  ADD KEY `IDX_4689E2F1549213EC` (`property_id`);

--
-- Index pour la table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_694309E4989D9B62` (`slug`),
  ADD UNIQUE KEY `UNIQ_694309E4571EDDA` (`homepage_id`),
  ADD KEY `IDX_694309E4FDFF2E92` (`thumbnail_id`),
  ADD KEY `IDX_694309E47E3C61F9` (`owner_id`);

--
-- Index pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_236473FEE9ED820C` (`block_id`),
  ADD KEY `IDX_236473FE126F525E` (`item_id`),
  ADD KEY `IDX_236473FEEA9FDD75` (`media_id`),
  ADD KEY `block_position` (`block_id`,`position`);

--
-- Index pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D4CE134F6BD1646960278D7` (`site_id`,`item_set_id`),
  ADD KEY `IDX_D4CE134F6BD1646` (`site_id`),
  ADD KEY `IDX_D4CE134960278D7` (`item_set_id`),
  ADD KEY `position` (`position`);

--
-- Index pour la table `site_page`
--
ALTER TABLE `site_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2F900BD9F6BD1646989D9B62` (`site_id`,`slug`),
  ADD KEY `IDX_2F900BD9F6BD1646` (`site_id`);

--
-- Index pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C593E731C4663E4` (`page_id`),
  ADD KEY `page_position` (`page_id`,`position`);

--
-- Index pour la table `site_permission`
--
ALTER TABLE `site_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C0401D6FF6BD1646A76ED395` (`site_id`,`user_id`),
  ADD KEY `IDX_C0401D6FF6BD1646` (`site_id`),
  ADD KEY `IDX_C0401D6FA76ED395` (`user_id`);

--
-- Index pour la table `site_setting`
--
ALTER TABLE `site_setting`
  ADD PRIMARY KEY (`id`,`site_id`),
  ADD KEY `IDX_64D05A53F6BD1646` (`site_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Index pour la table `user_setting`
--
ALTER TABLE `user_setting`
  ADD PRIMARY KEY (`id`,`user_id`),
  ADD KEY `IDX_C779A692A76ED395` (`user_id`);

--
-- Index pour la table `value`
--
ALTER TABLE `value`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1D7758349B66727E` (`value_annotation_id`),
  ADD KEY `IDX_1D77583489329D25` (`resource_id`),
  ADD KEY `IDX_1D775834549213EC` (`property_id`),
  ADD KEY `IDX_1D7758344BC72506` (`value_resource_id`),
  ADD KEY `value` (`value`(190)),
  ADD KEY `uri` (`uri`(190));

--
-- Index pour la table `value_annotation`
--
ALTER TABLE `value_annotation`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9099C97B9B267FDF` (`namespace_uri`),
  ADD UNIQUE KEY `UNIQ_9099C97B93B1868E` (`prefix`),
  ADD KEY `IDX_9099C97B7E3C61F9` (`owner_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `asset`
--
ALTER TABLE `asset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `property`
--
ALTER TABLE `property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT pour la table `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pour la table `resource_class`
--
ALTER TABLE `resource_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT pour la table `resource_template`
--
ALTER TABLE `resource_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT pour la table `site`
--
ALTER TABLE `site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_page`
--
ALTER TABLE `site_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_permission`
--
ALTER TABLE `site_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `value`
--
ALTER TABLE `value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=336;

--
-- AUTO_INCREMENT pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `api_key`
--
ALTER TABLE `api_key`
  ADD CONSTRAINT `FK_C912ED9D7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `asset`
--
ALTER TABLE `asset`
  ADD CONSTRAINT `FK_2AF5A5C7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD CONSTRAINT `FK_AA31FE4A7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK_1F1B251EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1F1B251ECBE0B084` FOREIGN KEY (`primary_media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD CONSTRAINT `FK_6D0C9625126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6D0C9625960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_set`
--
ALTER TABLE `item_set`
  ADD CONSTRAINT `FK_1015EEEBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_site`
--
ALTER TABLE `item_site`
  ADD CONSTRAINT `FK_A1734D1F126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A1734D1FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `FK_FBD8E0F87E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FK_6A2CA10C126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `FK_6A2CA10CBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `password_creation`
--
ALTER TABLE `password_creation`
  ADD CONSTRAINT `FK_C77917B4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `FK_8BF21CDE7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_8BF21CDEAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `FK_BC91F41616131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F4167E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_class`
--
ALTER TABLE `resource_class`
  ADD CONSTRAINT `FK_C6F063AD7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_C6F063ADAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource_template`
--
ALTER TABLE `resource_template`
  ADD CONSTRAINT `FK_39ECD52E448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E724734A3` FOREIGN KEY (`title_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52EB84E0D1D` FOREIGN KEY (`description_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD CONSTRAINT `FK_4689E2F116131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`),
  ADD CONSTRAINT `FK_4689E2F1549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `FK_694309E4571EDDA` FOREIGN KEY (`homepage_id`) REFERENCES `site_page` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E47E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E4FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD CONSTRAINT `FK_236473FE126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_236473FEE9ED820C` FOREIGN KEY (`block_id`) REFERENCES `site_page_block` (`id`),
  ADD CONSTRAINT `FK_236473FEEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD CONSTRAINT `FK_D4CE134960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D4CE134F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_page`
--
ALTER TABLE `site_page`
  ADD CONSTRAINT `FK_2F900BD9F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

--
-- Contraintes pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD CONSTRAINT `FK_C593E731C4663E4` FOREIGN KEY (`page_id`) REFERENCES `site_page` (`id`);

--
-- Contraintes pour la table `site_permission`
--
ALTER TABLE `site_permission`
  ADD CONSTRAINT `FK_C0401D6FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C0401D6FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_setting`
--
ALTER TABLE `site_setting`
  ADD CONSTRAINT `FK_64D05A53F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_setting`
--
ALTER TABLE `user_setting`
  ADD CONSTRAINT `FK_C779A692A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `value`
--
ALTER TABLE `value`
  ADD CONSTRAINT `FK_1D7758344BC72506` FOREIGN KEY (`value_resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D775834549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D77583489329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  ADD CONSTRAINT `FK_1D7758349B66727E` FOREIGN KEY (`value_annotation_id`) REFERENCES `value_annotation` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `value_annotation`
--
ALTER TABLE `value_annotation`
  ADD CONSTRAINT `FK_C03BA4EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD CONSTRAINT `FK_9099C97B7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
